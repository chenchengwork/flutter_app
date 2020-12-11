package com.example.flutter_app;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity{
    private static final String CHANNEL_COMMON = "sksz.flutter.io/common";

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        // 实例化一个公共通道
        new MethodChannel(getFlutterView(), CHANNEL_COMMON).setMethodCallHandler(
            new MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, Result result) {
                    switch (call.method){
                        case "getBatteryLevel":{
                            int batteryLevel = 2;
                            result.success(batteryLevel);
//                            result.error("404", "aa", new Object());
                        }
                        default:
                            result.notImplemented();
                    }
                }
            }
        );
    }
}
