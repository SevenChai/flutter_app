import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class ImageClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
            child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
        body: Container(
            height: 100,
            width: 300,
            child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')));
  }
}
