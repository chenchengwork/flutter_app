import 'package:flutter/material.dart';

class Exception404 extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("异常页面"),
      ),
      body: Center(
        child: Text("未找到对应的页面404!"),
      ),
    );
  }
}