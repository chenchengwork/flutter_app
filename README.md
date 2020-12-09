# flutter_app
flutter app开发脚手架

## 有用的资源
```
1. flutter资源合集
https://asmcn.icopy.site/awesome/awesome-flutter/


```

## 引用组件说明
```
1. json_model  // 直接将Json文件转为Dart model类
// 执行下面的命令生成对应模型文件
flutter packages pub run json_model src=jsons

2. 选择器
https://pub.dev/packages/flutter_picker

https://pub.dev/packages/direct_select_flutter

3. 扩展image的组件(增强)
https://github.com/fluttercandies/extended_image/blob/master/README-ZH.md
```

## 添加自定义icon
```
1. 在iconfont.cn上下载对应icon的字体
2. 在pubspec.yaml中添加字体描述
fonts:
    - family: appIcon
      fonts:
      - asset: static/fonts/appIcon.ttf
3. 在lib/common/appIcons.dart中定义字体中对应的icon
```

## 状态管理mobx使用
1. 步骤
```
1. 创建counter.dart
2. 添加 part 'counter.g.dart';
3. 添加 class Counter = CounterMobx with _$Counter;
4. 执行命令: flutter packages pub run build_runner build
5. 删除之内再生成: flutter packages pub run build_runner build --delete-conflicting-outputs
6. 实时更新.g文件: flutter packages pub run build_runner watch
```
2.store模板
```dart
import 'package:mobx/mobx.dart';

/// 必须, 用于生成.g文件
part 'counter.g.dart';
class Counter = CounterMobx with _$Counter;

/// Counter可观察对象
abstract class CounterMobx with Store {
  /// 可观察的值
  @observable int value = 0;

  /// 设置值
  @action void set(int value) {
    this.value = value;
  }
}
```

## 问题记录
1. 防止页面重绘制
```
使用AutomaticKeepAliveClientMixin
Flutter切换tab后保留tab状态 概述 Flutter中为了节约内存不会保存widget的状态,widget都是临时变量。当我们使用TabBar,TabBarView是我们就会发现,切换tab，initState又会被调用一次。

2. 监测页面生命周期：WidgetsBindingObserver
https://www.jianshu.com/p/2fd5562c1c9b
```
2.监测页面生命周期
```
使用WidgetsBindingObserver
class FlutterLifeCycleState extends State<FlutterLifeCycle> 
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: $state");
  }

  ///当前系统改变了一些访问性活动的回调
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    print("@@@@@@@@@ didChangeAccessibilityFeatures");
  }

  ///低内存回调
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    print("@@@@@@@@@ didHaveMemoryPressure");
  }

  /// Called when the system tells the app that the user's locale has
  /// changed. For example, if the user changes the system language
  /// settings.
  ///用户本地设置变化时调用，如系统语言改变
  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
    print("@@@@@@@@@ didChangeLocales");
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  ///应用尺寸改变时回调，例如旋转
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance.window.physicalSize;
    print("@@@@@@@@@ didChangeMetrics  ：宽：${size.width} 高：${size.height}");
  }

  /// {@macro on_platform_brightness_change}
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }

  ///文字系数变化
  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("flutter"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //销毁观察者
  }
}
```


