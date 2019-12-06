import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class ProgressClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProgressState();
  }
}

class ProgressState extends State<ProgressClassSevenor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('进度条1'),
              Expanded(
                  child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: Colors.grey,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: <Widget>[
                Text('进度条2'),
                SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircularProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.grey,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: <Widget>[
                Text('进度条3 '),
                Expanded(
                  child: SizedBox(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.yellow,
                      valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: <Widget>[
                Text('进度条4'),
                SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.yellow,
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      height: 44.0,
                      width: 44.0,

                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
