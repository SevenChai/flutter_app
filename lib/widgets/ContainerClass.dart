import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class ContainerClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        /*body: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          width: 48.0,
          height: 48.0,
        ));*/
        body: Container(
          //设置高度
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 2,
          ),
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue[600],
          alignment: Alignment.center,
          child: Text('Hello World',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white)),
          transform: Matrix4.rotationZ(0.1),
        ));
  }
}
