import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/timeRecordStore.dart';
import '../../routers/routers.dart';

class TimeRecordPage extends StatefulWidget{
  TimeRecordPage({Key key}) : super(key: key);

  @override
  TimeRecordPageState createState() => TimeRecordPageState();
}

class TimeRecordPageState extends State<TimeRecordPage>
    with AutomaticKeepAliveClientMixin<TimeRecordPage>, WidgetsBindingObserver{

  // wantKeepAlive设置为true保证widget不销毁
  @override
  bool get wantKeepAlive => true;

  final _timeRecordStore = new TimeRecordStore();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);  // 添加观察者
    print("TimeRecordPageState!");
  }

  @override
  Widget build(BuildContext context){

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text("获取远程数据"),
              onPressed: (){
                _timeRecordStore.getData();
              },
            ),

            RaisedButton(
              child: Text("改变数据"),
              onPressed: (){
//            _timeRecordStore.getData();
                _timeRecordStore.changeDataItem();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text("新页面传参方式1"),
              onPressed: (){
                Routes.navigatorUtil.jump(context, Routes.formatRoute(EnumRouter.newRoutePage1, ["路由path传递参数"]));
              },
            ),
            RaisedButton(
              child: Text("新页面传参方式2"),
              onPressed: (){
                Routes.navigatorUtil.jump(context, "${EnumRouter.newRoutePage2}?method=${Routes.convertParamUtil.cnParamsEncode("url参数方式传递")}");
              },
            ),

          ],
        ),

        Expanded(
          child: Container(
            child: Observer(builder: (_){

              return ListView(
                children: ListTile.divideTiles(context: context, tiles: _timeRecordStore.data.map((data){
                  return ListTile(
                      leading: Image.network(data.img),
                      title: Text(data.name),
                      subtitle: Text(data.address),
                      trailing: Icon(Icons.chevron_right));
                })).toList(),
              );
              return Text(_timeRecordStore.data.toString());
            }),
          ),
        ),

      ],
    );
  }
}