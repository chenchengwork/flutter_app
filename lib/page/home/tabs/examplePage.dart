import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_app/routers/routers.dart';
import 'package:flutter_app/store/timeRecordStore.dart';

class ExamplePage extends StatefulWidget{
  ExamplePage({Key key}) : super(key: key);

  @override
  ExamplePageState createState() => ExamplePageState();
}

class ExamplePageState extends State<ExamplePage>
    with AutomaticKeepAliveClientMixin<ExamplePage>, WidgetsBindingObserver{

  // wantKeepAlive设置为true保证widget不销毁
  @override
  bool get wantKeepAlive => true;
  final _exampleStore = new TimeRecordStore();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);  // 添加观察者
    print("ExamplePageState!");
  }

  @override
  Widget build(BuildContext context){

    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("获取远程数据"),
          onPressed: (){
            _exampleStore.getData();
          },
        ),
        RaisedButton(
          child: Text("改变数据"),
          onPressed: (){
//            _exampleStore.getData();
            _exampleStore.changeDataItem();
          },
        ),
        RaisedButton(
          child: Text("查看视频播放器"),
          onPressed: (){
            Routes.navigatorUtil.jump(context, EnumRouter.exampleFijkplayerPage);
          },
        ),

        RaisedButton(
          child: Text("新页面传参方式1"),
          onPressed: (){
            Routes.navigatorUtil.jump(context, Routes.formatRoute(EnumRouter.exampleRouteParamPage1, ["路由path传递参数"]));
          },
        ),
        RaisedButton(
          child: Text("新页面传参方式2"),
          onPressed: (){
            Routes.navigatorUtil.jump(context, "${EnumRouter.exampleRouteParamPage2}?method=${Routes.convertParamUtil.cnParamsEncode("url参数方式传递")}");
          },
        ),
        RaisedButton(
          child: Text("登录"),
          onPressed: (){
            Routes.navigatorUtil.jump(context, EnumRouter.loginPage);
          },
        ),

        Expanded(
          child: Container(
            child: Observer(builder: (_){

              return ListView(
                children: ListTile.divideTiles(context: context, tiles: _exampleStore.data.map((data){
                  return ListTile(
                      leading: Image.network(data.img),
                      title: Text(data.name),
                      subtitle: Text(data.address),
                      trailing: Icon(Icons.chevron_right));
                })).toList(),
              );
              return Text(_exampleStore.data.toString());
            }),
          ),
        ),

      ],
    );
  }
}