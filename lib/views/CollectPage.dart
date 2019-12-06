import 'package:flutter/material.dart';

class CollectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollectPageState();
  }
}

class CollectPageState extends State<CollectPage> {
  List<Book> _books = <Book>[
    Book('羊脂球', '莫泊桑', '。。。', 'assets/imgs/BALL of FAT.jpg'),
    Book('包法利夫人', '列夫托尔斯泰', '。。。', 'assets/imgs/Emma bovary.jpg'),
    Book('茶花女', '小仲马', '。。。', 'assets/imgs/La Traviata.jpg'),
  ];
  void _removeCollect(Book book) {
    //移除这本书
    setState(() {
      _books.remove(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _books.map((book) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(book.name,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )
                                  //color: Colors.blueGrey,
                                  ),
                            )
                          ],
                        ),
                        ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(book.img, fit: BoxFit.cover,),
                          ),
                          title: Text('作者：book.author'),
                          subtitle: Text('${book.desc}'),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              _removeCollect(book);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String name;
  final String author;
  final String desc;
  String img;
  Book(this.name, this.author, this.desc, this.img);
}
