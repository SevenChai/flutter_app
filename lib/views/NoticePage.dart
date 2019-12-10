import 'package:flutter/material.dart';
import '../Store.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoticePageState();
  }
}

class NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('共享数据${StoreWidget.of(context).data.toString()}');
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int cart = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: StoreWidget(
        data: cart,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: StoreWidget(), //子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text('自增'),
              onPressed: ()=>setState(()=>++cart),
            ),
          ],
        ),
      ),
    );
  }
}
