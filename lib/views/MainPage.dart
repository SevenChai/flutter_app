import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';
import '../components/BottomBar.dart';
import '../components/pageBottom/SinglePageBottom.dart';


class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  String _menuTitle = "";
  void onDataChange(val){
    print("======");
    print(val.title);
    this.setState((){
      _menuTitle = val.title;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: _buildBody(),
      floatingActionButton: SingleBtnPageBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      //父子传值 - 1 - 父组件声明
      bottomNavigationBar: BottomBar(data4Child: 'test', callback: (val)=>onDataChange(val),),


    );
  }
  Widget _buildBody(){
    if(_menuTitle == "list"){
      return Menus();
    }else if(_menuTitle == "collect"){
      return Collect();
    }else if(_menuTitle == "notification"){
      return Notification();
    }else if(_menuTitle == "account"){
      return Account();
    }else{
      return Menus();
    }
  }
}
class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menus = [
      {'path': '/alignClass', 'name': 'Align Class'},
      {'path': '/randomWords', 'name': 'Random Words'},
      {'path': '/containerClass', 'name': 'Container Class'},
      {'path': '/rowClass', 'name': 'Row Class'},
      {'path': '/columnClass', 'name': 'Column Class'},
      {'path': '/imageClass', 'name': 'Image Class'},
      {'path': '/textClass', 'name': 'Text Class'},
      {'path': '/iconClass', 'name': 'Icon Class'},
      {'path': '/formClass', 'name': 'Form Class'},
    ];
    final _menuWid = _menus.map((m) {
      return new RaisedButton(
        onPressed: () {
          print(m['path']);
          //pushReplacementNamed则是直接替换现在的页面，也就是说没有返回
          // Navigator.of(context).pushReplacementNamed(m['path']);
          Navigator.of(context).pushNamed(m['path']);
        },
        textColor: Colors.blue,
        child: Text(m['name']),
      );
    }).toList();

    // TODO: implement build
    return Container(
    width: 200,
    child: ListView(children: _menuWid
    /*children: <Widget>[
            RaisedButton(
              onPressed: () {
                print(_menus[0]);
              },
              textColor: Colors.blue,
              child: Text('goto:' + _menus[0]),
            ),
            RaisedButton(
              onPressed: () {
                print(_menus[1]);
              },
              textColor: Colors.blue,
              child: Text('goto:' + _menus[1]),
            ),
          ],*/
    ));
  }
}
class Collect extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Collect Page');
  }
}
class Notification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Notification Page');
  }
}
class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Account Page');
  }
}
/*class MenuBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  }
}*/
