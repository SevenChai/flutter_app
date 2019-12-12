import 'package:flutter/material.dart';
import '../../Model/Book.dart';
import '../../components/returnHomePage.dart';

class BookIntroClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookIntroState();
  }
}

class BookIntroState extends State<BookIntroClass> {
  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context).settings.arguments;

    print(book);
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      book.img,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                book.author,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: Container(
                          child: Text(
                            book.desc,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
