import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import './utils/event/http_error_event.dart';
import './utils/request/code.dart';
import './utils/T.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> with HttpErrorListener{

  @override
  void initState(){
    // final router = Router();
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Routes.router = router;
    super.initState();
  }

  //app的根widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter脚手架',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routes.router.generator,
    );
  }
}

mixin HttpErrorListener on State<App> {
  StreamSubscription stream;

  @override
  void initState() {
    super.initState();

    stream = T.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        showToast("网络错误");
        break;
      case 401:
        showToast("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]");
        break;
      case 403:
        showToast("403权限错误");
        break;
      case 404:
        showToast("404错误");
        break;
      case 422:
        showToast("请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。");
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        showToast("请求超时");
        break;
      default:
        showToast("其他异常" + " " + message);
        break;
    }
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }
}
