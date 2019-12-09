import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class AnimationClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationState();
  }
}
class AnimationState extends State<AnimationClassSevenor>{
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: _selected ? 200.0 : 100.0,
              height: _selected ? 100.0 : 200.0,
              color: _selected ? Colors.red : Colors.blue,
              alignment: _selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
          ),
        ));
  }
}
