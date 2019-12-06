import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class CardClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardState();
  }
}

class CardState extends State<CardClassSevenor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  title: Text('标题'),
                  subtitle:
                      Text('卡片： 自带圆角与阴影'),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('PASS'),
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('FAIL'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 300,
                height: 100,
                child: Text('一个可以点击的卡片'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
