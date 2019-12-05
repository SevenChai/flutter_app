import 'package:flutter/material.dart';

class LeftMenuClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LeftMenuState();
  }
}

class LeftMenuState extends State<LeftMenuClass> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _menuFtStyle = TextStyle(
      color: Colors.black87,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    );
    // TODO: implement build
    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: PreferredSize(
            child: Center(
              child: Text(
                '菜单栏',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            preferredSize: Size.fromHeight(50)),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: Text(
                '菜单1',
                style: _menuFtStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: Text(
                '菜单2',
                style: _menuFtStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: Text(
                '菜单2',
                style: _menuFtStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
