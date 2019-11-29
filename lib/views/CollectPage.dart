import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';
import '../components/BottomBar.dart';

class CollectPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollectPageState();
  }
}
class CollectPageState extends State<CollectPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Container(
        height: 100,
        child: Text('Collect Page'),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}