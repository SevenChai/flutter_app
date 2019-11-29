import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/listPage');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/collectPage');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/noticePage');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/accountPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
