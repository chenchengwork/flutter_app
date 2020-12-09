import 'package:flutter/material.dart';

///主页drawer
class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Drawer(
        ///侧边栏按钮Drawer
        child: new Container(
          ///默认背景
          color: Colors.blue,
          child: new SingleChildScrollView(
            ///item 背景
            child: Container(
              constraints: new BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height),
              child: new Material(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                        title: new Text(
                          "1111111111"
                        )
                    ),
                    new ListTile(
                        title: new Text(
                            "222222222"
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
