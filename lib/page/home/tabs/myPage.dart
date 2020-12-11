import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{

  MyPage({Key key}): super(key: key);

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin<MyPage>, WidgetsBindingObserver{

  @override
  bool get wantKeepAlive => true;

  bool _switchSelected = true;
  bool _checkboxSelected = false;

  @override
  void initState() {
    super.initState();
    print("MyPageState!");
  }

  @override
  Widget build(BuildContext context){
    super.build(context);

    return Wrap(
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("我的用户信息页面"),
      ],
    );

  }
}