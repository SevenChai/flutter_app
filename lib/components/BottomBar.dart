import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
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
                  print('here , here ');
                  changeSelect(m);
                  print(_selected);
                  print(_selected == m);
                  //Navigator.of(context).pushReplacementNamed(m.path);
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
  Menu(title: '列表', icon: Icons.list , path: '/listPage'),
  Menu(title: '收藏', icon: Icons.favorite, path: '/collectPage' ),
  Menu(title: '消息', icon: Icons.notifications, path: '/noticePage' ),
  Menu(title: '账户', icon: Icons.account_box , path: '/accountPage'),
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
