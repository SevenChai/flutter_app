import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class StepperClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StepperState();
  }
}

class StepperState extends State<StepperClassSevenor> {
  int _currentStepIndex = 0;
  final List<Step> _steps = [
    Step(
      title: Text('Step1'),
      content: Column(
        children: <Widget>[
          Text('Content'),
          Text('Content'),
          Text('Content'),
        ],
      ),
      isActive: true,
    ),
    Step(
      title: Text('Step2'),
      content: Column(
        children: <Widget>[
          Text('Content'),
          Text('Content'),
          Text('Content'),
        ],
      ),
      isActive: true,
    ),
    Step(
      title: Text('Step3'),
      content: Column(
        children: <Widget>[
          Text('Content'),
          Text('Content'),
          Text('Content'),
        ],
      ),
      isActive: true,
    ),
    Step(
      title: Text('Step4'),
      content: Column(
        children: <Widget>[
          Text('Content'),
          Text('Content'),
          Text('Content'),
        ],
      ),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Stepper(
          steps: _steps,
          currentStep: _currentStepIndex,
          onStepTapped: (int index) {
            setState(() {
              _currentStepIndex = index;
            });
          },
          onStepContinue: () {
            //下一步
            setState(() {
              if (_currentStepIndex < _steps.length - 1) {
                _currentStepIndex = _currentStepIndex + 1;
              } else {
                //_currentStepIndex = 0;
              }
            });
          },
          onStepCancel: () {
            //回到上一步
            setState(() {
              if (_currentStepIndex > 0) {
                _currentStepIndex = _currentStepIndex - 1;
              } else {
                _currentStepIndex = 0;
              }
            });
          },
        ));
  }
}
