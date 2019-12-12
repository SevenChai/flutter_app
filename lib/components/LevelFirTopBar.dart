import 'package:flutter/material.dart';
import 'dart:async';
import '../demos/MainData.dart';
import '../services/CartStore.dart';
import '../services/LoginStore.dart';
import '../components/LoadingDialog.dart';

class LevelFirTopBar extends StatefulWidget {
  LevelFirTopBar({Key key, this.menuTitle}) : super(key: key);
  String menuTitle;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LevelFirTopBarState();
  }
}

class LevelFirTopBarState extends State<LevelFirTopBar> {
  var _cartStoreOn;
  int cartNum = 3;
  Choice _selectedChoice = choices[0]; // The app's "state".
  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
      print(_selectedChoice.title);
    });
  }

  String _menuTitleStr = "flutter小组件";
  List<String> _menuTitleLists = ['flutter小组件', '收藏中心', '消息中心', '账户中心'];
  _getMenuCh() {
    if (widget.menuTitle == "list" || widget.menuTitle == "") {
      return _menuTitleLists[0];
    }
    if (widget.menuTitle == "collect") {
      return _menuTitleLists[1];
    }
    if (widget.menuTitle == "notification") {
      return _menuTitleLists[2];
    }
    if (widget.menuTitle == "account") {
      return _menuTitleLists[3];
    }
  }

  bool _isShowDialog = false;
  void _showLoading(String msg) {
    /// 避免重复弹出
    if (mounted && !_isShowDialog){
      _isShowDialog = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder:(_) {
            return WillPopScope(
              onWillPop: () async {
                // 拦截到返回键，证明dialog被手动关闭
                _isShowDialog = false;
                return Future.value(true);
              },
              child: LoadingDialog(text: msg),
            );
          }
      );
    }
  }
  void _hideLoading() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShareDataWidget(
      child: AppBar(
        /*leading: Container(
        width: 50.0,
        height: 50.0,
        child: Center(
          child: Text('LOGO'),
        ),
      ),*/
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.list),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(_getMenuCh()),
        actions: <Widget>[
          /*new IconButton(
            icon: new Icon(Icons.home),
            onPressed: () {
              print('go home');
              //没有返回按钮
              Navigator.of(context).pushNamed('/');
            }),*/
          Center(
            child: ShareDataWidget.getData(context).isLogin ? Text('Admin') : Text(''),
          ),
          ShareDataWidget.getData(context).isLogin ? Center(
            child: Row(
              children: <Widget>[
                new IconButton(
                  iconSize: 20.0,
                  padding: EdgeInsets.only(left: 20.0),
                  icon: new Icon(choices[1].icon),
                  disabledColor: Colors.red,
                  onPressed: null,
                ),
                Text("(${ cartNum })", style: TextStyle(color: Colors.red),),
              ],
            ),
          ) : Center(
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text("快捷登录"),
                  onPressed: (){
                    _showLoading("快捷登录中...");
                    Timer(Duration(seconds: 2), (){
                      //隐藏dialog
                      _hideLoading();
                      loginEventBus.fire(LoginStore(true, "seven"));
                    });

                  },
                ),
              ],
            ),
          ),
          new PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                      value: choice, child: Text(choice.title));
                }).toList();
              })
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._cartStoreOn = cartEventBus.on<CartStore>().listen((event){
      if(event.action == "add"){
        setState(() {
          cartNum ++;
        });
      }

    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    //ShareDataWidget.getData(context).data.toString()
    print("didChangeDependencies = " );
  }
  @override
  void dispose() {
    this._cartStoreOn.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '', icon: null),
  const Choice(title: 'Cart', icon: Icons.add_shopping_cart),
  const Choice(title: '子页面1', icon: Icons.directions_boat),
  const Choice(title: '子页面2', icon: Icons.directions_bus),
  const Choice(title: '子页面3', icon: Icons.directions_railway),
  const Choice(title: '子页面4', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
