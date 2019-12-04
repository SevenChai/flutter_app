import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../components/returnHomePage.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });
  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                  text: label,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('switch label is tapped');
                    }),
            ),
          ),
          Switch(
            value: value,
            onChanged: (bool newVal) {
              onChanged(newVal);
            },
          ),
        ],
      ),
    );
  }
}

class CustomSwitchClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomSwitchState();
  }
}

class CustomSwitchState extends State<CustomSwitchClass> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Center(
        child: CustomSwitch(
          label: 'Cus Switch',
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          value: _isSelected,
          onChanged: (bool newVal){
            setState(() {
              _isSelected = newVal;
            });
          },
        ),
      )
    );
  }
}
