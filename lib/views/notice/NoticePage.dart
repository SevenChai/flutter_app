import 'package:flutter/material.dart';
import './CallerPage.dart';
import './AnswerPage.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoticePageState();
  }
}

class NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/callerPage');
                    },
                    child: Text('打电话的人'),),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/answerPager');
                    },
                    child: Text('接听电话的人'),),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: CallerPageClass(),
              ),
              Expanded(
                child: AnswerPageClass(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
