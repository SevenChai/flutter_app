import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';
import '../components/BottomBar.dart';

class NoticePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoticePageState();
  }
}
class NoticePageState extends State<NoticePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Container(
        height: 100,
        child: Text('Notice Page'),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}