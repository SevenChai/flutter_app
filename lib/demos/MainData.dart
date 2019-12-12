import 'package:flutter/material.dart';

//仅支持向子组件中传递数据，但是子组件不允许修改该数据
class ShareDataWidget extends InheritedWidget {
  final bool isLogin; //需要在子树中共享的数据
  ShareDataWidget({@required this.isLogin, Widget child}) : super(child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget getData(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.isLogin != isLogin;
  }
}
