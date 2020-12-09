import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{

  SecondPage({Key key}): super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> with AutomaticKeepAliveClientMixin<SecondPage>, WidgetsBindingObserver{

  @override
  bool get wantKeepAlive => true;

  bool _switchSelected = true;
  bool _checkboxSelected = false;

  @override
  void initState() {
    super.initState();
    print("SecondPageState!");
  }

  @override
  Widget build(BuildContext context){
    super.build(context);

    return Wrap(
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("ssss"),
        Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqqsssssssssssssssss"),
      ],
    );

    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '第二个页面',
        ),
        Switch(
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
          activeColor: Colors.red,
        ),
        TextField(
          autofocus: false,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)
          ),
//              textInputAction,:""
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.green[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
      ],
    );

  }
}