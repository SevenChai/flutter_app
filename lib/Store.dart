import 'package:flutter/material.dart';

class StoreWidget extends InheritedWidget{
  StoreWidget({
    @required this.data,
    Widget child
  }) : super(child: child);
  final int data;
  static StoreWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(StoreWidget);
  }
  @override
  bool updateShouldNotify(StoreWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}