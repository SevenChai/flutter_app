import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  //父子传值 - 1 - 子组件定义
  BottomBar({ Key key, this.data4Child, this.callback }): super(key: key);
  final callback;
  String data4Child;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  Menu _selected = menus[0];
  void changeSelect(Menu menu){
    setState(() {
      _selected = menu;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50.0,
        child: Row(
          children: menus.map((Menu m){
            return Expanded(
              child: IconButton(
                icon: Icon(
                  m.icon,
                  color: _selected.title==m.title ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  if(m.path != null){
                    print('here , here ');
                    changeSelect(m);
                    print(_selected);
                    print(_selected == m);

                    //父子传值 - 1 - 子组件emit给父组件
                    widget.callback(m);

                    //Navigator.of(context).pushReplacementNamed(m.path);
                  }

                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class Menu {
  const Menu({ this.title, this.icon, this.path });
  final String title;
  final IconData icon;
  final String path;
}
const List<Menu> menus = const <Menu>[
  Menu(title: 'list', icon: Icons.format_list_numbered_rtl , path: '/listPage'),
  Menu(title: 'collect', icon: Icons.star, path: '/collectPage' ),
  Menu(title: 'placeholder', icon: null, path: null ),
  Menu(title: 'notification', icon: Icons.notifications, path: '/noticePage' ),
  Menu(title: 'account', icon: Icons.account_circle , path: '/accountPage'),
];
class MenuCard extends StatelessWidget{
  const MenuCard({ Key key, this.menu }) : super( key: key );
  final Menu menu;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(menu.title);
  }
}
