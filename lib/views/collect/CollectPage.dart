import 'package:flutter/material.dart';
import '../../Model/Book.dart';
import '../../components/returnHomePage.dart';
import '../../services/CartStore.dart';

class CollectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollectPageState();
  }
}

class CollectPageState extends State<CollectPage> {
  List<Book> _books = <Book>[
    Book(
        '羊脂球',
        '莫泊桑',
        '以1870—1871年普法战争为背景。通过代表当时法国社会各阶层的10个人同乘一辆马车逃往一个港口的故事，形象地反映出资产阶级在这场战争中所表现出的卑鄙自私和出卖人民的丑恶嘴脸。',
        'assets/imgs/BALL of FAT.jpg'),
    Book(
        '包法利夫人',
        '列夫托尔斯泰',
        '作品讲述的是一个受过贵族化教育的农家女爱玛的故事。她瞧不起当乡镇医生的丈夫包法利，梦想着传奇式的爱情。可是她的两度偷情非但没有给她带来幸福，却使她自己成为高利贷者盘剥的对象。最后她积债如山，走投无路，只好服毒自尽。',
        'assets/imgs/Emma bovary.jpg'),
    Book(
        '茶花女',
        '小仲马',
        '故事讲述了一个青年人与巴黎上流社会一位交际花曲折凄婉的爱情故事。作品通过一个妓女的爱情悲剧，揭露了法国七月王朝上流社会的糜烂生活。对贵族资产阶级的虚伪道德提出了血泪控诉。',
        'assets/imgs/La Traviata.jpg'),
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
    return Column(
      children: <Widget>[
        /*Container(
          height: 50,
          child: ShareDataWidget(
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.audiotrack),
                    label: Text("是否登录？：" )),
              ],
            ),
          ),
        ),*/
        Expanded(
          child: BookList(
            books: _books,
          ),
        ),
      ],
    );
  }
}

class BookList extends StatelessWidget {
  final List<Book> books;
  BookList({Key key, @required this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _gotoDetail(Book book) {
      //Navigator.pushNamed(context, '/bookDetailClass');
      /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailClass(book: book),
      ),
    );*/
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookDetailClass(),
          settings: RouteSettings(
            arguments: book,
          ),
        ),
      );*/
      Navigator.pushNamed(context, '/bookDetailClass', arguments: book);
      /* using push */
      /*
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=>ProductPush.ProductDetailPage(product:products[index]),
        ));
       */
    }

    // TODO: implement build
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
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
                        child: Text(books[index].name,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      //color: Colors.blueGrey,
                    ),
                  ),
                  IconButton(tooltip: "加入购物车", icon: Icon(Icons.add_circle_outline), color: Colors.grey, onPressed: (){
                    cartEventBus.fire(CartStore("add", books[index].name));
                  }),
                ],
              ),
              ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      books[index].img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('作者：book.author'),
                  subtitle: Text(
                    '${books[index].desc}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Container(
                    width: 20.0,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 25,
                      icon: Icon(
                        Icons.chevron_right,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        _gotoDetail(books[index]);
                        //_removeCollect(book);
                      },
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

class BookDetailClass extends StatelessWidget {
  //定义一个被传递的数据，搭配直接传递数据使用
  /*final Book book;
  BookDetailClass({Key key, @required this.book}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    //搭配setting使用
    final Book book = ModalRoute.of(context).settings.arguments;
    print(book);
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: Card(
        child: Column(
          children: <Widget>[
            Text('传递的数据：'),
            Text(book.name),
            Text(book.author),
            Text(book.desc),
            Container(
              width: 50,
              height: 50,
              child: Image.asset(
                book.img,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
