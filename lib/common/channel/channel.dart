import 'package:flutter/services.dart';

class Channel{
    static const _platformCommon = const MethodChannel('sksz.flutter.io/common');

    // 获取电池电量
    static Future<String> getBatteryLevel() async{
      try {
        final int result = await _platformCommon.invokeMethod("getBatteryLevel");
        return "电量为: $result% .";
      }on PlatformException catch(e){
        print("***************************");
        print(e.message);
        return e.message;
      }
    }
}