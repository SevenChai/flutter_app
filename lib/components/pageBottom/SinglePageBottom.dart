import 'package:flutter/material.dart';

class SingleBtnPageBottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SingleBtnPageBottomState();
  }
}

class SingleBtnPageBottomState extends State<SingleBtnPageBottom> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'add button',
      child: Icon(Icons.add),
    );
  }
}
