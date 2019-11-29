import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class AccountPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountPageState();
  }
}
class AccountPageState extends State<AccountPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Container(
        height: 100,
        child: Text('Account Page'),
      ),
    );
  }
}