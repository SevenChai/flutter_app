import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class AlignClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
          child: Align(
            alignment: Alignment.topRight,
            child: Text('rop right'),
          ),
        ));
  }
}
