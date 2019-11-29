import 'package:flutter/material.dart';

/*class ReturnToHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _pushSaved() {
      Navigator.of(context).pushReplacementNamed('/');
    }

    // TODO: implement build
    return AppBar(title: new Text('子页面'), actions: <Widget>[
      new IconButton(icon: new Icon(Icons.home), onPressed: _pushSaved),
    ]);
  }
}*/
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
      title: Text('子页面'),
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
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
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
