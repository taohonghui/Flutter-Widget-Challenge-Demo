import 'package:flutter/material.dart';
import 'package:flutter_challenge_demo/contacts.dart';

class ChallengeListPage extends StatefulWidget {
  final int listType;

  const ChallengeListPage({Key key, this.listType}) : super(key: key);

  @override
  _ChallengeListPageState createState() => _ChallengeListPageState();
}

class _ChallengeListPageState extends State<ChallengeListPage> {
  List listData ;

  @override
  Widget build(BuildContext context) {
    if (this.widget.listType == TabItem.LAYOUT)
      listData = ListContacts.layoutList;
    if (this.widget.listType == TabItem.ANIMATION)
      listData = ListContacts.animationList;
    if (this.widget.listType == TabItem.STATE)
      listData = ListContacts.statetList;
    if (this.widget.listType == TabItem.OTHER)
      listData = ListContacts.otherList;

    return SafeArea(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(listData[index]["router"]);
            },
            child:  Card(
              child:  Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child:  Text(listData[index]["item"]["label"]),
              ),
            ),
          );
        },
        itemCount: listData.length,
      ),
    );
  }
}
//
