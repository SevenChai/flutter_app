import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class FormClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormClassState();
  }
}

enum SingingCharacter { lafayette, jefferson }

class FormClassState extends State<FormClassSevenor> {
  SingingCharacter _character = SingingCharacter.lafayette;
  final _formkey = GlobalKey<FormState>();
  bool _checkVal = false;
  bool _checkVal2 = true;
  void _changeCheckbox(bool val) {
    print("change the checkbox is : $val");
    setState(() {
      _checkVal = val;
    });
  }

  bool _isRememberPwd = true;
  double _sliderVal = 10.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),*/
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you ?',
                labelText: 'Name *',
              ),
              onSaved: (String value) {
                print(value);
              },
              validator: (String value) {
                print(value);
                return value.contains('@') ? 'do not use @ char.' : null;
              },
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkVal,
                  checkColor: Colors.white,
                  onChanged: _changeCheckbox,
                ),
                Text('check-1'),
                Checkbox(
                  value: _checkVal2,
                  checkColor: Colors.white,
                  onChanged: (bool newVal) {
                    setState(() {
                      _checkVal2 = newVal;
                    });
                  },
                ),
                Text('check-2'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter val) {
                    setState(() {
                      _character = val;
                    });
                  },
                ),
                Text('radio-1'),
                Radio(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter val) {
                    setState(() {
                      _character = val;
                    });
                  },
                ),
                Text('radio-2')
              ],
            ),
            SwitchListTile(
              title: Text('是否记住密码?'),
              value: _isRememberPwd,
              onChanged: (bool value) {
                setState(() {
                  _isRememberPwd = value;
                });
              },
              secondary: const Icon(Icons.access_alarm),
            ),
            Slider(
              value: _sliderVal,
              min: 0.0,
              max: 100.0,
              divisions: 10,
              inactiveColor: Colors.red,
              activeColor: Colors.blueGrey,
              onChanged: (double newVal){
                setState(() {
                  _sliderVal = newVal;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
