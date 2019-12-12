import 'package:flutter/material.dart';
import '../../services/EventBus.dart';

class AnswerPageClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerPageState();
  }
}

class AnswerPageState extends State<AnswerPageClass> {
  var _eventBusOn;
  List<String> getMsgList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(children: getMsgList.map((msg)=>Row(children: <Widget>[Text(msg)],)).toList()),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._eventBusOn = eventBus.on<ProductContentEvent>().listen((event){
      setState(() {
        getMsgList.add(event.str);
      });
    });
  }
  @override
  void dispose() {
    this._eventBusOn.cancel();
    // TODO: implement dispose
    super.dispose();
  }

}
