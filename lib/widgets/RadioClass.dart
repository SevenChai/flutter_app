import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class RadioClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RadioClassState();
  }
}

enum SingingCharacter { radio1, radio2, radio3 }
SingingCharacter _radioGroup = SingingCharacter.radio1;

class RadioClassState extends State<RadioClassSevenor> {
  void _radioChanged(val) {
    setState(() {
      _radioGroup = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              /* Radio(
                value: SingingCharacter.radio1,
                groupValue: _radioGroup,
                onChanged: _radioChanged,
              ),
              Radio(
                value: SingingCharacter.radio2,
                groupValue: _radioGroup,
                onChanged: _radioChanged,
              ),*/
              RadioListTile<SingingCharacter>(
                title: Text('radio1'),
                value: SingingCharacter.radio1,
                groupValue: _radioGroup,
                onChanged: _radioChanged,
              ),
              RadioListTile<SingingCharacter>(
                title: Text('radio2'),
                value: SingingCharacter.radio2,
                groupValue: _radioGroup,
                onChanged: _radioChanged,
              ),
              RadioListTile<SingingCharacter>(
                title: Text('radio3'),
                value: SingingCharacter.radio3,
                groupValue: _radioGroup,
                onChanged: _radioChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
