import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆页'),
      ),
      body: Container(
        child: Text('到这个页面基本上，再次返回推出APP'),
      ),
    );
  }
}