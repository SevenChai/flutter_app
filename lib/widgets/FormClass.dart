import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class FormClassSevenor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    void _changeCheckbox(bool val){
      print("change the checkbox $val");
      val = !val;
    }
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you ?',
                labelText: 'Name *',
              ),
              onSaved: (String value) {
                print(value);
              },
              validator: (String value) {
                return value.contains('@') ? 'do not use @ char.' : null;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            Checkbox(
              value: true,
              checkColor: Colors.grey,
              onChanged: _changeCheckbox,
            )
          ],
        ),
      ),
    );
  }
}
