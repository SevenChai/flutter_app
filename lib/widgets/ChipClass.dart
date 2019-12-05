import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class ChipClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = "seven";
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Chip(
        label: Text('Chip'),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('联系人'),
        ),
      ),
    );
  }
}
