import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/challengePage/layout/immersive_status_bar.dart';
import 'package:flutter_challenge_demo/challengePage/layout/slide_menu.dart';
import 'package:flutter_challenge_demo/challengePage/layout/todo_list.dart';
import 'package:flutter_challenge_demo/challengePage/sample/music/music_player.dart';

import 'challengePage/animation/gestures.dart';

//配置每个页面的对应表
class ListContacts {
  static List layoutList = [
    {
      "router": "/layout/immersive_status_bar",
      "item": {
        "label": "沉浸式状态栏",
        "widget": (context) {
          return ImmersiveStatusBar();
        },
      }
    },
    {
      "router": "/layout/todo_list",
      "item": {
        "label": "列表清单",
        "widget": (context) {
          return TodoListWidget();
        },
      }
    },
    {
      "router": "/layout/slide_menu",
      "item": {
        "label": "侧滑删除",
        "widget": (context) {
          return SlideMenu();
        },
      }
    },
    {
      "router": "/layout/test4",
      "item": {
        "label": "页面4",
        "widget": (context) {
          return new Text("test4");
        },
      }
    },
  ];
  static List animationList = [
    {
      "router": "/animation/gestures",
      "item": {
        "label": "手势demo",
        "widget": (context) {
          return GesturesDemo();
        },
      }
    },
    {
      "router": "/animation/test2",
      "item": {
        "label": "test2",
        "widget": (context) {
          return new Text("test2");
        },
      }
    },
    {
      "router": "/animation/test3",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test3");
        },
      }
    },
    {
      "router": "/animation/test4",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test4");
        },
      }
    },
  ];

  static List statetList = [
    {
      "router": "/statetList/test1",
      "item": {
        "label": "test1",
        "widget": (context) {
          return new Text("test1");
        },
      }
    },
    {
      "router": "/statetList/test2",
      "item": {
        "label": "test2",
        "widget": (context) {
          return new Text("test2");
        },
      }
    },
    {
      "router": "/statetList/test3",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test3");
        },
      }
    },
    {
      "router": "/statetList/test4",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test4");
        },
      }
    },
  ];

  static List otherList = [
    {
      "router": "/otherList/music_player",
      "item": {
        "label": "音乐播放器",
        "widget": (context) {
          return MusicPlayer();
        },
      }
    },
    {
      "router": "/otherList/test2",
      "item": {
        "label": "test2",
        "widget": (context) {
          return new Text("test2");
        },
      }
    },
    {
      "router": "/otherList/test3",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test3");
        },
      }
    },
    {
      "router": "/otherList/test4",
      "item": {
        "label": "123",
        "widget": (context) {
          return new Text("test4");
        },
      }
    },
  ];
}

//路由
class ChallengeRouters {
   static Map<String, WidgetBuilder> _routers = new Map();

  static Map<String, WidgetBuilder> getRouters()  {

    for(var item in ListContacts.layoutList){
      String router = item["router"];
      WidgetBuilder widgetBuilder = item["item"]["widget"];
      _routers.putIfAbsent(router, () => widgetBuilder);
    }

    for(var item in ListContacts.animationList){
      String router = item["router"];
      WidgetBuilder widgetBuilder = item["item"]["widget"];
      _routers.putIfAbsent(router, () => widgetBuilder);
    }
    for(var item in ListContacts.statetList){
      String router = item["router"];
      WidgetBuilder widgetBuilder = item["item"]["widget"];
      _routers.putIfAbsent(router, () => widgetBuilder);
    }
    for(var item in ListContacts.otherList){
      String router = item["router"];
      WidgetBuilder widgetBuilder = item["item"]["widget"];
      _routers.putIfAbsent(router, () => widgetBuilder);
    }
    return _routers;
  }
}

//tab页相关
class TabItem {
  const TabItem({this.title, this.icon, this.type});

  final String title;
  final IconData icon;
  final int type;
  static final int LAYOUT = 0;
  static final int ANIMATION = 1;
  static final int STATE = 2;
  static final int OTHER = 3;

  static List<TabItem> tabItems = const <TabItem>[
    const TabItem(title: '布局相关', icon: Icons.layers, type: 0),
    const TabItem(title: '动画相关', icon: Icons.album, type: 1),
    const TabItem(title: '状态相关', icon: Icons.access_alarm, type: 2),
    const TabItem(title: '设计例子', icon: Icons.gamepad, type: 3),
  ];
}
