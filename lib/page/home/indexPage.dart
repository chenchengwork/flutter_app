import 'package:flutter/material.dart';
import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'package:flutter_app/layout/tabBarWidget.dart';

import 'home_drawer.dart';
import './tabs/examplePage.dart';
import './tabs/myPage.dart';

class IndexPage extends StatefulWidget {
  final String title;

  IndexPage({Key key, this.title}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final GlobalKey<ExamplePageState> examplePageKey = new GlobalKey();
  final GlobalKey<MyPageState> myPageKey = new GlobalKey();
  int _currentIndex = 0;

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  List<String> tabTitles = ["例子", "我的"];

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Icons.home, tabTitles[0]),
      _renderTab(Icons.supervised_user_circle, tabTitles[1]),
    ];

    return WillPopScope(
      // 拦截返回键
      onWillPop: () async{
        return true;
      },
      child: new TabBarWidget(
        drawer: new HomeDrawer(),
        type: TabType.bottom,
        tabItems: tabs,
        tabViews: [
          new ExamplePage(key: examplePageKey),
          new MyPage(key: myPageKey),
        ],
        onDoublePress: (index) {
          switch (index) {
            case 0:
           // examplePageKey.currentState.scrollToTop();
              break;
            case 1:
           // myPageKey.currentState.scrollToTop();
              break;
          }
        },
        backgroundColor: Colors.blue,
        indicatorColor: Colors.transparent,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        title: Text(tabTitles[_currentIndex]),
      ),
    );
  }

}
