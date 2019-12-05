import 'package:flutter/material.dart';
import '../components/LevelFirTopBar.dart';
import '../components/BottomBar.dart';
import '../components/pageBottom/SinglePageBottom.dart';
import '../components/LeftMenu.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  String _menuTitle = "";
  void onDataChange(val) {
    print("======");
    print(val.title);
    this.setState(() {
      _menuTitle = val.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      drawer: LeftMenuClass(),
      appBar: PreferredSize(
          child: LevelFirTopBar(), preferredSize: Size.fromHeight(50)),
      body: _buildBody(),
      floatingActionButton: SingleBtnPageBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //浮动而不是

      //父子传值 - 1 - 父组件声明
      bottomNavigationBar: BottomBar(
        data4Child: 'test',
        callback: (val) => onDataChange(val),
      ),
    );
  }

  Widget _buildBody() {
    if (_menuTitle == "list") {
      return Menus();
    } else if (_menuTitle == "collect") {
      return Collect();
    } else if (_menuTitle == "notification") {
      return Notification();
    } else if (_menuTitle == "account") {
      return Account();
    } else {
      return Menus();
    }
  }
}

class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _menus = [
    Menu( '/alignClass', 'Align'),
      /* {'path': '/randomWords',''Random Words'},*/
      Menu( '/containerClass','Container'),
      Menu( '/rowClass','Row'),
      Menu( '/columnClass','Column'),
      Menu( '/imageClass','Image'),
      Menu( '/textClass','Text'),
      Menu( '/iconClass','Icon'),
      Menu( '/formClass','Form'),
      Menu( '/radioClass','Radio'),
      Menu( '/cusRadioClass','自定义Radio'),
      Menu( '/cusSwitchClass','自定义Switch'),
      Menu( '/dataTableClass','Table'),
      Menu( '/panelListsClass','面板列表'),
      Menu( '/chipClass','Chip'),
      Menu( '/cardClass','Card'),

    ];
    final _menuWid = _menus.map((m) {
      /*return RaisedButton(
        onPressed: () {
          print(m['path']);
          //pushReplacementNamed则是直接替换现在的页面，也就是说没有返回
          // Navigator.of(context).pushReplacementNamed(m['path']);
          Navigator.of(context).pushNamed(m['path']);
        },
        textColor: Colors.blue,
        child: Text(m['name']),
      );*/
      return ListTile(
        title: new Text(m.name, style: TextStyle(fontSize: 15.0)),
        trailing: new Icon(
          Icons.arrow_forward,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(m.path);
        },
      );
    }).toList();

    // TODO: implement build
    return Container(
      child: ListView(
        children: _menuWid,
      ),
    );
  }
}

class Collect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Collect Page');
  }
}

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Notification Page');
  }
}

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Account Page');
  }
}

class Menu {
  final String name;
  final String path;
  Menu(
      this.path,
      this.name,
  );
}
