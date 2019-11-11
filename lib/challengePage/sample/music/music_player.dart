import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer();

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: Container(
          color: Colors.red,
          child: SafeArea(
            top: true,
            child: Container(
              color: Colors.indigo,
              child: Text("123"),
            ),
          ),
        ),
      ),
    );
  }
}