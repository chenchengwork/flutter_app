import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_app/common/channel/channel.dart';

class NewRoutePage extends StatefulWidget{
  String method;

  NewRoutePage({this.method});

  @override
  _NewRoutePageState createState() => _NewRoutePageState();
}

class _NewRoutePageState extends State<NewRoutePage>{
  String _batteryLevel = "";

  _getBatteryLevel() async{
    var batteryLevel = await Channel.getBatteryLevel();
    setState((){
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context){


    var container = Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: _getBatteryLevel, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: Center(
              child: Text(this._batteryLevel),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
            title: Text("New Route")
        ),
        body: container
    );
  }
}