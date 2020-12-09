import 'package:fluro/fluro.dart';
import 'navigatorUtil.dart';
import 'routeHandler.dart';
import 'convertParamUtil.dart';

class EnumRouter {
  static final String root = '/';
  static final String indexPage = '/indexPage';
  static final String login = '/login';
  static final String newRoutePage1 = 'newRoutePage1';
  static final String newRoutePage2 = 'newRoutePage2';
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

    router.define(EnumRouter.indexPage, handler: indexHandler);         // 首页页面配置
    router.define("${EnumRouter.newRoutePage1}/:method", handler: newRouteHandler1);   // 新页面配置
    router.define(EnumRouter.newRoutePage2, handler: newRouteHandler2);   // 新页面配置
  }
}