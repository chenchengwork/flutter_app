import 'dart:async';
import 'package:flutter_app/utils/request/result_data.dart';
import 'package:flutter_app/models/timeRecord.dart';

import 'package:flutter_app/utils/T.dart';


/// 第一种实现方案
//Future<ResultData> getTimeRecord() async {
//  ResultData resp = await T.httpClient.get("getTimeRecord");
//  if(resp.result){
//    List<TimeRecord> _data = new List<TimeRecord>();
//    resp.data.forEach((item){
//      _data.add(TimeRecord.fromJson(item));
//    });
//
//    resp.data = _data;
//    return resp;
//  }else {
//    throw resp;
//  }
//}

/// 第二种实现方案
Future<ResultData<List<TimeRecord>>> getTimeRecord() async {
  ResultData resp = await T.httpClient.get("getTimeRecord");
  if(resp.result){
    List<TimeRecord> _data = new List<TimeRecord>();
    resp.data.forEach((item){
      _data.add(TimeRecord.fromJson(item));
    });

    return ResultData.from<List<TimeRecord>>(resp, _data);
  }else {
    throw resp;
  }
}