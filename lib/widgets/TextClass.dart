import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class TextClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = "seven";
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Row(children: <Widget>[
          Text(
            'hi $_name! how are you ? ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text( 'hi $_name! how are you ? ' ),
          ),
          Expanded(
            child: Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
          ),
          Text(
            'hi $_name! how are you ? ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]));
  }
}
