import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/widget/slide_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<String> data = <String>[
    '{"message":"打篮球","date":"11月27日"}',
    '{"message":"看英语","date":"11月05日"}',
    '{"message":"安排计划","date":"11月30日"}',
    '{"message":"唱歌","date":"10月27日"}'
  ];

  Key _myKey;
  @override
  void initState() {
//    getSlideButton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: data.length,
            itemBuilder: (context, i) {
              Map item = JsonDecoder().convert(data[i]);
              return SlideItem(
                  hideButtonWidth: 80,
                  hideWidgets: getSlideButton(null,i),
                  slideWidget: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(11),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              "assets/images/user_photo.jpeg",
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    item["message"],
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "今天打篮球",
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(item["date"])
                      ],
                    ),
                  ));
            }));
  }

  List<Widget> getSlideButton(BuildContext context,int index) {
    List<Widget> slideButtons = [];
//    SlideItem.of(context).close();
    slideButtons.add(buildAction("置顶", Colors.black12, () {
      print("子组件点击第"+index.toString()+"项");
      Fluttertoast.showToast(msg: "置顶");
    }));
    slideButtons.add(buildAction("已读", Colors.amberAccent, () {
      print("子组件点击第"+index.toString()+"项");
      Fluttertoast.showToast(msg: "已读");
    }));
    slideButtons.add(buildAction("删除", Colors.red, () {
      print("子组件点击第"+index.toString()+"项");
      setState(() {
        data.removeAt(index);
      });
      Fluttertoast.showToast(msg: "删除");
    }));

    return slideButtons;
  }

  InkWell buildAction(String text, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: 80,
        color: color,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }

}


