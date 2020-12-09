import "package:flutter/material.dart";

class NewRoutePage extends StatelessWidget{
  String method;

  NewRoutePage({this.method});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route")
      ),
      body: Center(
        child: Text("传递的参数值为:${this.method}"),
      )
    );
  }
}