// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeRecordStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimeRecordStore on TimeRecordStoreMobx, Store {
  final _$dataAtom = Atom(name: 'TimeRecordStoreMobx.data');

  @override
  List<TimeRecord> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<TimeRecord> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$TimeRecordStoreMobxActionController =
      ActionController(name: 'TimeRecordStoreMobx');

  @override
  void getData() {
    final _$actionInfo = _$TimeRecordStoreMobxActionController.startAction(
        name: 'TimeRecordStoreMobx.getData');
    try {
      return super.getData();
    } finally {
      _$TimeRecordStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDataItem() {
    final _$actionInfo = _$TimeRecordStoreMobxActionController.startAction(
        name: 'TimeRecordStoreMobx.changeDataItem');
    try {
      return super.changeDataItem();
    } finally {
      _$TimeRecordStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
