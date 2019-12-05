import 'package:flutter/material.dart';

class LevelFirTopBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LevelFirTopBarState();
  }
}

class LevelFirTopBarState extends State<LevelFirTopBar> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
      print(_selectedChoice.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
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
      title: Text('Demo Test'),
      actions: <Widget>[
        /*new IconButton(
            icon: new Icon(Icons.home),
            onPressed: () {
              print('go home');
              //没有返回按钮
              Navigator.of(context).pushNamed('/');
            }),*/
        new IconButton(
          // action button
          icon: new Icon(choices[0].icon),
          onPressed: () {
            _select(choices[0]);
            //Navigator.pop(context);
          },
        ),
        new IconButton(
          // action button
          icon: new Icon(choices[1].icon),
          onPressed: () {
            _select(choices[1]);
          },
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
    );
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
