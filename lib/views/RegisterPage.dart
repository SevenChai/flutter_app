import 'package:flutter/material.dart';
import '../components/RegOrLogTopBar.dart';
import '../demos/MainData.dart';

class RegisterClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

enum SingingCharacter { male, female }

class RegisterState extends State<RegisterClass> {
  final _btnStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  List<String> actions = ['login', 'register'];
  String _defAction = 'login';
  void _changeAction(String action) {
    setState(() {
      _defAction = action;
    });
  }

  final _formkey = GlobalKey<FormState>();
  String _phone = "";
  String _pwd = "";
  SingingCharacter _gender = SingingCharacter.male;
  String _province = "北京市";
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    dynamic routerParams = ModalRoute.of(context).settings.arguments;
    if (routerParams != null && routerParams["isLogin"] != null) {
      isLogin = routerParams["isLogin"];
    }
    // TODO: implement build
    return isLogin
        ? Container(
            color: Colors.blue,
            child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "您已登录，点击进入系统",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                )),
          )
        : Scaffold(
            appBar: PreferredSize(
                child: RegOrLogTopBar(), preferredSize: Size.fromHeight(50)),
            body: SingleChildScrollView(
              child: Container(
                //color: Color.fromRGBO(200, 200, 200, 0.5),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  color: _defAction == actions[0]
                                      ? Colors.blue
                                      : Color.fromRGBO(200, 200, 200, 0.5),
                                  child: FlatButton(
                                      onPressed: () {
                                        _changeAction(actions[0]);
                                      },
                                      child: Text(
                                        '登录',
                                        style: _btnStyle,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: _defAction == actions[1]
                                      ? Colors.blue
                                      : Color.fromRGBO(200, 200, 200, 0.5),
                                  child: FlatButton(
                                      onPressed: () {
                                        _changeAction(actions[1]);
                                      },
                                      child: Text(
                                        '注册',
                                        style: _btnStyle,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Form(
                              key: _formkey,
                              child: new Builder(
                                builder: (BuildContext context) {
                                  return _RegisterForm(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    /*child: */
                    ),
              ),
            ));
  }

  Widget _RegisterForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  right: 10.0,
                  top: 0.0,
                  bottom: 0.0,
                ),
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('手机'),
                  ),
                  width: 60,
                  height: 60,
                  //color: Colors.blue,
                )),
            Expanded(
              child: Container(
                //height: 40,
                //color: Colors.pink,
                child: TextFormField(
                  //maxLength: 11,
                  decoration: const InputDecoration(
                    icon: null,
                    prefixText: '+86 ',
                    prefixStyle: TextStyle(
                      // height: 30.0,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(200, 200, 200, 0.3),
                    border: InputBorder.none,
                  ),
                  initialValue: _phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '手机号码不能为空';
                    }
                    RegExp mobile = new RegExp(
                        r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
                    if (!mobile.hasMatch(value)) {
                      return '请输入正确的手机号码';
                    }
                    setState(() {
                      _phone = value;
                    });
                    return null;
                  },
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  right: 10.0,
                  top: 0.0,
                  bottom: 0.0,
                ),
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('密码'),
                  ),
                  width: 60,
                  height: 60,
                  //color: Colors.blue,
                )),
            Expanded(
              child: Container(
                //height: 40,
                //color: Colors.grey,
                child: TextFormField(
                  obscureText: true,
                  //maxLength: 10,
                  decoration: const InputDecoration(
                    icon: null,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: InputBorder.none,
                    //helperText: "请输入6-10位密码",
                    filled: true,
                    fillColor: Color.fromRGBO(200, 200, 200, 0.3),
                  ),
                  initialValue: _pwd,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '密码不能为空';
                    }
                    if (value.length < 6) {
                      return "请输入6-10位密码";
                    }
                    if (value.length > 10) {
                      return "请输入6-10位密码";
                    }
                    setState(() {
                      _pwd = value;
                    });
                    return null;
                  },
                ),
              ),
            )
          ],
        ),
        _defAction == actions[1]
            ? Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        child: Center(
                          child: Text('性别'),
                        ),
                        width: 60,
                      )),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text('男'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Radio(
                      value: SingingCharacter.male,
                      groupValue: _gender,
                      onChanged: (SingingCharacter val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                  ),
                  Text('女'),
                  Radio(
                    value: SingingCharacter.female,
                    groupValue: _gender,
                    onChanged: (SingingCharacter val) {
                      setState(() {
                        _gender = val;
                      });
                    },
                  ),
                ],
              )
            : Container(
                height: 0.0,
              ),
        _defAction == actions[1]
            ? Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        child: Center(
                          child: Text('地址'),
                        ),
                        width: 60,
                      )),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text('==请选择=='),
                            value: "",
                          ),
                          DropdownMenuItem(
                            child: Text('北京市'),
                            value: "北京市",
                          ),
                          DropdownMenuItem(
                            child: Text('上海市'),
                            value: "上海市",
                          )
                        ],
                        hint: Text('请选择省份'),
                        onChanged: (String val) {
                          setState(() {
                            _province = val;
                          });
                        },
                        value: _province,
                        //减少按钮的高度。
                        // 默认情况下，此按钮的高度与其菜单项的高度相同。
                        // 如果isDense为true，则按钮的高度减少约一半。
                        // 这个当按钮嵌入添加的容器中时，非常有用
                        isDense: false,
                        iconSize: 30.0,
                        /*style: TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    ),*/
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                height: 0.0,
              ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    print('校验通过');
                    /*print('手机：$_phone');
                    print('密码：$_pwd');
                    print('性别：$_gender');
                    print('地址：$_province');*/
                    Navigator.of(context).pushReplacementNamed("/");
                    //修改登录状态

                  }
                },
                child: Text(
                  '提交',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Text(
                      '跳过，点进去看看',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ),
            )
          ],
        ),
      ],
    );
    /*Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        child: FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('您已登录，点击直接进入系统')),
      ),
    );*/
  }
}
