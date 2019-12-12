import 'package:flutter/material.dart';
import '../../services/EventBus.dart';

class CallerPageClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CallerPageState();
  }
}

class CallerPageState extends State<CallerPageClass> {
  final _textKey = GlobalKey<FormFieldState>();
  String _callStr = "";
  List<String> broadMsgs = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 100.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        key: _textKey,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'say something ?',
                          labelText: 'Call',
                        ),
                        initialValue: _callStr,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          eventBus.fire(ProductContentEvent(_textKey.currentState.value));
                          if(_textKey.currentState.value != ""){
                            setState(() {
                              broadMsgs.add(_textKey.currentState.value);

                            });
                          }

                        })
                  ],
                ),
              ],
            )),
        Expanded(
          child: ListView(
            children: broadMsgs.map((msg)=>Row(children: <Widget>[Text(msg)],)).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }
}
