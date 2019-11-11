import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImmersiveStatusBar extends StatefulWidget {
  @override
  _ImmersiveStatusBarState createState() => _ImmersiveStatusBarState();
}

class _ImmersiveStatusBarState extends State<ImmersiveStatusBar> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.red
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("沉浸式状态栏"),),
      body: Column(children: <Widget>[
        RaisedButton(child: Text("隐藏状态栏信息"),onPressed: (){
          SystemChrome.setEnabledSystemUIOverlays([]);
        },),
        RaisedButton(child: Text("显示状态栏信息和底部操作栏"),onPressed: (){
          SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
        },)
      ],),
    );
  }
}
