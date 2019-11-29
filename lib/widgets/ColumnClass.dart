import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class ColumnClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Container(
            // width: 120,
            height: 100,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Text('Deliver features faster test testDeliver features faster test test',
                        textAlign: TextAlign.center)),
                Expanded(
                  child:
                      Text('Craft beautiful UIs', textAlign: TextAlign.center),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: const FlutterLogo(),
                  ),
                ),
              ],
            )));
  }
}
