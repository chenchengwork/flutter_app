import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers.dart';

import '../page/home/indexPage.dart';
import '../page/login/loginPage.dart';

class NavigatorUtil {
  // 返回
  void goBack(BuildContext context) {
    Routes.router.pop(context);
  }

  // 带参数的返回
  void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 路由返回指定页面
  void goBackUrl(BuildContext context, String title) {
    Navigator.popAndPushNamed(context, title);
  }

  /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  Future jump(BuildContext context, String title) {
    return Routes.router.navigateTo(context, title, transition: TransitionType.inFromRight);
  }

  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  Future jumpLeft(BuildContext context, String title) {
    return Routes.router
        .navigateTo(context, title, transition: TransitionType.inFromLeft);
  }

  Future jumpRemove(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => IndexPage(),
        ),
            (route) => route == null);
  }

  /// 自定义 转场动画
  Future goTransitionCustom(BuildContext context, String title) {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
        scale: animation,
        child: new RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };

    return Routes.router.navigateTo(context, title,
        transition: TransitionType.custom,

        /// 指定是自定义动画
        transitionBuilder: transition,

        /// 自定义的动画
        transitionDuration: const Duration(milliseconds: 600));
  }

  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// Fluro本身不带，但是 Flutter自带
  Future goTransitionCupertinoDemoPage(
      BuildContext context, String title) {
    return Routes.router
        .navigateTo(context, title, transition: TransitionType.cupertino);
  }


  /*
    -------------------------------------------------------------------------------------------
    | 以下为业务跳转方法
    --------------------------------------------------------------------------------------------
   */
  // 跳转到主页面
  void goIndexPage(BuildContext context) {
    Routes.router.navigateTo(context, EnumRouter.indexPage, replace: true);
  }

  // 跳转到主页面IndexPage并删除当前路由
  void goToHomeRemovePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => IndexPage(),
        ),
            (route) => route == null);
  }

  // 跳转到登录页并删除当前路由
  void goToLoginRemovePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
            (route) => route == null);
  }
}