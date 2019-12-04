import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../components/returnHomePage.dart';


class CustomRadio extends StatelessWidget {
  const CustomRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });
  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
            groupValue: groupValue,
            value: value,
            onChanged: (bool newVal){
              onChanged(newVal);
            },
          ),
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = (){
                  print('label has been tapped');
                }
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRadioClass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomRadioState();
  }
}

bool _isRadioSelected = false;
class CustomRadioState extends State<CustomRadioClass>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomRadio(
            label: 'first cus-radio',
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            groupValue: _isRadioSelected,
            value: true,
            onChanged: (bool newVal){
              setState(() {
                _isRadioSelected = newVal;
              });
            },
          ),
          CustomRadio(
            label: 'second cus-radio',
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            groupValue: _isRadioSelected,
            value: false,
            onChanged: (bool newVal){
              setState(() {
                _isRadioSelected = newVal;
              });
            },
          ),
        ],
      ),
    );
  }
}