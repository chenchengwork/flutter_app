import 'package:flutter_app/models/timeRecord.dart';
import 'package:mobx/mobx.dart';
import '../api/timeRecord.dart';

/// 必须, 用于生成.g文件
part 'timeRecordStore.g.dart';
class TimeRecordStore = TimeRecordStoreMobx with _$TimeRecordStore;


/// Counter可观察对象
abstract class TimeRecordStoreMobx with Store {
  @observable List<TimeRecord> data = [];

  /// 设置值
  @action void getData(){
    getTimeRecord().then((value){
//      print(value);
//      List<TimeRecord> _data = [];
//      value.data.forEach((item){
//         _data.add(TimeRecord.fromJson(item));
//      });
//      this.data = _data;
      print("-----------------响应结果-------------------");
      print(value);
       this.data = value.data;
    }).catchError((e){
      print("-----------------error-------------------");
      print(e.data);
    });

  }
  
  @action void changeDataItem(){
    if(this.data.length > 0){
      List<TimeRecord> _data = [];
      _data.add(TimeRecord.fromJson({"name": "chencheng", "address": "sss", "img": ""}));
      this.data = _data;
    }
  }
}