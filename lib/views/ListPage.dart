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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Menus(),
      floatingActionButton: SingleBtnPageBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomBar(),
    );
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
        child: Text('goto:' + m['name'] + 'test'),
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
