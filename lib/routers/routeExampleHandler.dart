import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers.dart';

import 'package:flutter_app/page/examples/fijkplayer/fijkplayer.dart';
import 'package:flutter_app/page/examples/routeParams/routeParamPage.dart';

class ExampleHandlerManager{
  /// 新路由页面1
  static final Handler routeParamHandler1 = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<Object>> params){
        return new RouteParamPage(method:params["method"][0]);
      }
  );

  /// 新路由页面2
  static final Handler routeParamHandler2 = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<Object>> params){
        String method = Routes.convertParamUtil.cnParamsDecode(params["method"][0]);
        return new RouteParamPage(method:method);
      }
  );

  /// 视频播放器
  static final Handler fijkplayerPageHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<Object>> params){
        // String method = Routes.convertParamUtil.cnParamsDecode(params["method"][0]);

        return new FijkplayerPage();
      }
  );
}




