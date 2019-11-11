import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/challenge_list_page.dart';
import 'package:flutter_challenge_demo/contacts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _routers;

  @override
  void initState() {
    _routers = ChallengeRouters.getRouters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      home: DefaultTabController(
        length: TabItem.tabItems.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Challenge Demo"),
            bottom: TabBar(
              tabs: TabItem.tabItems.map((TabItem tabItem) {
                return Tab(
                  text: tabItem.title,
                  icon: Icon(tabItem.icon),
                );
              }).toList(),
              indicatorColor: Colors.white,
              labelColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: TabItem.tabItems.map((TabItem tabItem) {
              return ChallengeListPage(
                listType: tabItem.type,
              );
            }).toList(),
          ),
        ),
      ),
      routes: _routers,
    );
  }
}
