import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/widget/slide_item.dart';

class GesturesDemo extends StatefulWidget {
  @override
  _GesturesDemoState createState() => _GesturesDemoState();
}

class _GesturesDemoState extends State<GesturesDemo>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double maxDragDistance;
  List<Widget> slideButtons = [];
  double translateX = 0;
  final Map<Type, GestureRecognizerFactory> gestures =
      <Type, GestureRecognizerFactory>{};

  @override
  void initState() {
    maxDragDistance = 150; //隐藏button宽度

    getSlideButton();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
          child: SlideItem(
              hideButtonWidth: 50,
              hideWidgets: slideButtons,
              slideWidget: Container(
                height: 80,
                child: Text("1231231231"),
                color: Colors.indigo,
              )),
        )));
  }

  void getSlideButton() {
    slideButtons.add(buildAction("置顶", Colors.yellowAccent, () {}));
    slideButtons.add(buildAction("已读", Colors.green, () {}));
    slideButtons.add(buildAction("删除", Colors.red, () {}));
  }

  InkWell buildAction(String text, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        color: color,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
