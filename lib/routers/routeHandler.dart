import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_app/page/common/splashPage.dart';
import 'package:flutter_app/page/common/exceptionPage.dart';
import 'package:flutter_app/page/home/indexPage.dart';
import 'package:flutter_app/page/login/loginPage.dart';


/// 启动页面
Handler splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return new SplashPage();
    }
);

/// 异常404页面
Handler exception404Handler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return new Exception404();
    }
);


class AppHandlerManager{
  /// 首页页面
  static final Handler indexHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        return new IndexPage();
      }
  );

  /// 登录页面
  static final Handler loginHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        return new LoginPage();
      }
  );

}




