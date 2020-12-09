import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';

void main() {
  runZoned((){
    runApp(App());
  },
  onError: (Object obj, StackTrace stack){
    print("***********************obj************************");
    print(obj);
    print("***********************stack************************");
    print(stack);
  });
}


