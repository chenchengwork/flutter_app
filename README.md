# flutter_app
flutter app开发脚手架

## 有用的资源
```
1. flutter资源合集
https://asmcn.icopy.site/awesome/awesome-flutter/

2. Dart 如何优雅的避空
https://juejin.cn/post/6844903781784616974#heading-3

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



