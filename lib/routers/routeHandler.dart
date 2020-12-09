import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers.dart';

import '../page/common/splashPage.dart';
import '../page/common/exceptionPage.dart';
import '../page/home/indexPage.dart';
import '../page/newRoutePage.dart';


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

/// 首页页面
Handler indexHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return new IndexPage();
    }
);

/// 新路由页面1
Handler newRouteHandler1 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params){

      return new NewRoutePage(method:params["method"][0]);
    }
);

/// 新路由页面2
Handler newRouteHandler2 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params){
      String method = Routes.convertParamUtil.cnParamsDecode(params["method"][0]);

      return new NewRoutePage(method:method);
    }
);

