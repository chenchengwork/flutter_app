import 'package:fluro/fluro.dart';
import 'navigatorUtil.dart';
import 'convertParamUtil.dart';
import 'routeHandler.dart';
import 'routeExampleHandler.dart';

class EnumRouter {
  static final String root = '/';
  static final String indexPage = '/indexPage';
  static final String loginPage = 'loginPage';

  ///*****************example路由枚举*********************
  static final String exampleRouteParamPage1 = 'exampleRouteParamPage1';
  static final String exampleRouteParamPage2 = 'exampleRouteParamPage2';
  static final String exampleFijkplayerPage = 'exampleFijkplayerPage';
}

class Routes {
  static FluroRouter router;
  static final ConvertParamUtil convertParamUtil = new ConvertParamUtil();
  static final NavigatorUtil navigatorUtil = new NavigatorUtil();
  static String formatRoute(String route, List<String> params){
    params.forEach((element) {
      route += "/" + element;
    });

    return route;
  }

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = exception404Handler;                       // 未找到路由
    router.define(EnumRouter.root, handler: splashHandler);             // 定义启动页面

    ///*********************app路由配置***********************
    router.define(EnumRouter.loginPage, handler: AppHandlerManager.loginHandler);       // 登录
    router.define(EnumRouter.indexPage, handler: AppHandlerManager.indexHandler);       // 首页

    ///*********************example路由配置***********************
    router.define("${EnumRouter.exampleRouteParamPage1}/:method", handler: ExampleHandlerManager.routeParamHandler1);   // 新页面配置
    router.define(EnumRouter.exampleRouteParamPage2, handler: ExampleHandlerManager.routeParamHandler2);   // 新页面配置
    router.define(EnumRouter.exampleFijkplayerPage, handler: ExampleHandlerManager.fijkplayerPageHandler);   // fijkplayer

  }
}