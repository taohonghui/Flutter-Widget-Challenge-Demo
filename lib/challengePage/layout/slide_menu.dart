import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/widget/slide_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SlideMenu extends StatefulWidget {
  @override
  _SlideMenuState createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  AnimationController animationController;
  double maxDragDistance;
  double itemHeight;
  List<Widget> slideButtons = [];
  double translateX = 0;
  final Map<Type, GestureRecognizerFactory> gestures =
      <Type, GestureRecognizerFactory>{};
  Key _key;

  @override
  void initState() {
    maxDragDistance = 150; //隐藏button宽度
    _key = UniqueKey();
    getSlideButton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
          child: SlideItem(
              key: _key,
              hideButtonWidth: 80,
              hideWidgets: slideButtons,
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
                                "陶大锤",
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
                    Text("19:08")
                  ],
                ),
              )),
        )));
  }

  void getSlideButton() {
    slideButtons.add(buildAction("置顶", Colors.black12, () {
      print("子组件点击");
      Fluttertoast.showToast(msg: "置顶");
    }));
    slideButtons.add(buildAction("已读", Colors.amberAccent, () {
      print("子组件点击");

      Fluttertoast.showToast(msg: "已读");
    }));
    slideButtons.add(buildAction("删除", Colors.red, () {
      print("子组件点击");

      Fluttertoast.showToast(msg: "删除");
    }));
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
