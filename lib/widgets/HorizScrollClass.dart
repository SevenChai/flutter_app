import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class HorizScrollClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HorizScrollState();
  }
}

class HorizScrollState extends State<HorizScrollClassSevenor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Container(
        height: 200.0,
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.lightBlue,
            ),
            Container(
              width: 160.0,
              color: Colors.amber,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Text(
                    '水平',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                  Text(
                    '列表',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                  Icon(Icons.list),
                ],
              ),
            ),
            Container(
              width: 160.0,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              width: 160.0,
              color: Colors.black,
            ),
            Container(
              width: 160.0,
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}
