import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class IconClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = "seven";
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Semantics(
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              Icon(
                Icons.add_to_queue,
                color: Colors.green,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Icon(
                Icons.account_box,
                color: Colors.grey,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Icon(
                Icons.add_shopping_cart,
                color: Colors.red,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ]));
  }
}
