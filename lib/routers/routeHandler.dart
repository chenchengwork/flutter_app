import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers.dart';

import 'package:flutter_app/page/common/splashPage.dart';
import 'package:flutter_app/page/common/exceptionPage.dart';
import 'package:flutter_app/page/home/indexPage.dart';
import 'package:flutter_app/page/newRoutePage.dart';
import 'package:flutter_app/page/fijkplayer.dart';
import 'package:flutter_app/page/login_page.dart';


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

/// 登录页面
Handler loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return new LoginPage();
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

/// 视频播放器
Handler myPlayerPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params){
      // String method = Routes.convertParamUtil.cnParamsDecode(params["method"][0]);

      return new MyPlayerPage();
    }
);

