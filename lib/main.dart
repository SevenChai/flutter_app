import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './demos/RandomWordDemo.dart';
import './widgets/AlignClass.dart';
import './widgets/ContainerClass.dart';
import './widgets/RowClass.dart';
import './widgets/ColumnClass.dart';
import './widgets/ImageClass.dart';
import './widgets/TextClass.dart';
import './widgets/IconClass.dart';
import './widgets/FormClass.dart';
import './widgets/RadioClass.dart';
import './widgets/CustomRadioClass.dart';
import './widgets/CustomSwitchClass.dart';
import './components/RandomPanelLists.dart';
import './widgets/ChipClass.dart';
import './widgets/DataTableClass.dart';
import './widgets/CardClass.dart';
import './widgets/ProgressClass.dart';
import './widgets/ListTitleClass.dart';
import './widgets/StepperClass.dart';
import './widgets/AnimationClass.dart';
import './widgets/HorizScrollClass.dart';

import './views/MainPage.dart';
import './views/RegisterPage.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintPointersEnabled = true;
  //debugPaintLayerBordersEnabled = true;
  //debugRepaintRainbowEnabled = true;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcom to Flutter World'),
        ),
        body: Center(
            //child: Text('Hello World'),
            //child: Text(wordPair.asPascalCase)
            child: RandomWords()
        ),
      ),
    );
    */
    return new MaterialApp(
      title: "Startup Name Generator",
      debugShowCheckedModeBanner: false, //去除右上角的Debug标签
      theme: new ThemeData(
        primaryColor: Colors.blue, // 更改主题
      ),
      home: new ListPage(),
      // 添加路由
      routes: <String, WidgetBuilder>{
        //页面
        /* "/listPage": (BuildContext context) => new ListPage(),
        "/collectPage": (BuildContext context) => new CollectPage(),
        "/noticePage": (BuildContext context) => new NoticePage(),
        "/accountPage": (BuildContext context) => new AccountPage(),*/
        "/register": (BuildContext context) => new RegisterClass(),

        //Class Widget
        "/alignClass": (BuildContext context) =>
            new AlignClassSevenor(), //对应的页面Class
        "/randomWords": (BuildContext context) => new RandomWords(),
        "/containerClass": (BuildContext context) =>
            new ContainerClassSevenor(),
        "/rowClass": (BuildContext context) => new RowClassSevenor(),
        "/columnClass": (BuildContext context) => new ColumnClassSevenor(),
        "/imageClass": (BuildContext context) => new ImageClassSevenor(),
        "/textClass": (BuildContext context) => new TextClassSevenor(),
        "/iconClass": (BuildContext context) => new IconClassSevenor(),
        "/formClass": (BuildContext context) => new FormClassSevenor(),
        "/radioClass": (BuildContext context) => new RadioClassSevenor(),
        "/cusRadioClass": (BuildContext context) => new CustomRadioClass(),
        "/cusSwitchClass": (BuildContext context) => new CustomSwitchClass(),
        "/panelListsClass": (BuildContext context) =>
            new RandomPanelListsClass(),
        "/chipClass": (BuildContext context) => new ChipClassSevenor(),
        "/dataTableClass": (BuildContext context) =>
            new DataTableClassSevenor(),
        "/cardClass": (BuildContext context) => new CardClassSevenor(),
        "/listTitleClass": (BuildContext context) =>
            new ListTitleClassSevenor(),
        "/progressClass": (BuildContext context) => new ProgressClassSevenor(),
        "/stepperClass": (BuildContext context) => new StepperClassSevenor(),
        "/animationClass": (BuildContext context) => new AnimationClassSevenor(),
        "/horizScrollClass": (BuildContext context) => new HorizScrollClassSevenor(),
      },
    );
  }
}

/*class Menus extends StatelessWidget {
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
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        title: Text('Test Demo'),
      ),
      body: Container(
          width: 200,
          child: ListView(children: _menuWid
              */ /*children: <Widget>[
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
          ],*/ /*
              )),
      floatingActionButton: SingleBtnPageBottom(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomBar(),
    );
  }
}*/
