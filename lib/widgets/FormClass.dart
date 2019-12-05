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

  //设置默认显示的日期为当前
  DateTime initialDate = DateTime.now();
  void showDefaultYearPicker(BuildContext context) async {
    final DateTime dt = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2018, 1),
        lastDate: DateTime(2022, 1),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });
    if (dt != null && dt != initialDate) {
      setState(() {
        initialDate = dt;
      });
    }
  }

  //设置显示显示的时间为当前
  TimeOfDay initialTime = TimeOfDay.now();
  void showDefaultMonthPicker(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (timeOfDay != null && timeOfDay != initialTime) {
      setState(() {
        initialTime = timeOfDay;
      });
    }
  }

  //SimpleDialog
  void _askedToLead() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  print("点击了dialog");
                },
                child: const Text('dialog内容'),
              ),
            ],
          );
        });
  }

  //AlertDialog
  void _neverSatisfied() async {
    return showDialog(
        context: context,
        barrierDismissible: false, //用户必须点击按钮， 点击空白区域无效
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("确定删除？"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('text1'),
                  Text('text2'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // 隐藏Dialog
                },
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //BottomSheet
  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 30.0,
            child: Text('底部 Sheet'),
          );
        }).then((val) {
      print(val);
    });
  }

  //SnackBar
  /*final _snackBar = SnackBar(
    content: Text('SnackBar'),
    backgroundColor: Colors.blue,
  );
  void _openSnackbar(){
    //Scaffold.of(context).showSnackBar(_snackBar);
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Form(
        key: _formkey,
        child: new Builder(builder: (BuildContext context) {
          return _FormColumn(context);
        }),
      ),
    );
  }

  Widget _FormColumn(BuildContext context) {
    return Column(
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
          inactiveColor: Colors.grey,
          activeColor: Colors.blue,
          label: '$_sliderVal ',
          onChanged: (double newVal) {
            setState(() {
              _sliderVal = newVal;
            });
          },
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  showDefaultYearPicker(context);
                },
                icon: Icon(
                  Icons.date_range,
                  color: Colors.blue,
                ),
                label: Text('日期'),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  showDefaultMonthPicker(context);
                },
                icon: Icon(
                  Icons.update,
                  color: Colors.blue,
                ),
                label: Text('时间'),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  _askedToLead();
                },
                icon: Icon(
                  Icons.adjust,
                  color: Colors.blue,
                ),
                label: Text('弹出框'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                onPressed: () {
                  _neverSatisfied();
                },
                icon: Icon(
                  Icons.adjust,
                  color: Colors.blue,
                ),
                tooltip: "AlertDialog",
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  _openBottomSheet();
                },
                icon: Icon(
                  Icons.adjust,
                  color: Colors.blue,
                ),
                tooltip: '底部Sheet',
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  final snackBar = new SnackBar(
                    content: new Text("这是一个Snackbar"),
                    action: new SnackBarAction(label: "close", onPressed: () {}),
                  );
                  //Scaffold.of() called with a context that does not contain a Scaffold.
                  //重新传入builder
                  //When the Scaffold is actually created in the same build function,
                  // the context argument to the build function can't be used to find the Scaffold
                  // (since it's "above" the widget being returned in the widget tree).
                  // In such cases, the following technique with a Builder can be used to provide a new scope with a BuildContext that is "under" the Scaffold
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.blue,
                ),
                tooltip: 'SnackBar',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
