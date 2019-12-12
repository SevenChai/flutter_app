import 'package:flutter/material.dart';
import '../../demos/MainData.dart';

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
      onPressed: () {
        //跳转到登录页面
        Navigator.pushNamed(context, '/register', arguments: {
          'isLogin': ShareDataWidget.getData(context).isLogin,
        });
      },
      tooltip: 'Register',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('登录'),
          Text('注册'),
        ],
      ),
    );
  }
}
