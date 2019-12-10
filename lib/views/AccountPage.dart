import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../Store.dart';

class AccountPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountPageState();
  }
}
class AccountPageState extends State<AccountPage>{
  List<Account> _accounts = <Account>[
    Account('1', '2', '3', '4', '5', '6', '7','8', '9'),
  ];
  Future<http.Response> getAccountLiss() async{
        final res = await http.get('https://global-openapi.bithumb.pro/openapi/v1/spot/config');
        if(res.statusCode == 200){
          final data = json.decode(res.body).data.coinConfig;
          data.map((json){
            print(json);
          });
        }else{
          print('error');
        }
        return res;
  }
  @override
  void initState() {
    // TODO: implement initState
    //页面初始化
    super.initState();
    getAccountLiss();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //页面销毁
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AccountList(accounts: _accounts,);
  }
}

class AccountList extends StatelessWidget{
  final List<Account> accounts;
  AccountList({Key key, @required this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (context, index){
          print(index);
          print(accounts);
          return Row(
            children: <Widget>[
              Text('测试'),
              /*Text('${ accounts[index].depositStatus }'),
              Text('${ accounts[index].fullName }'),
              Text('${ accounts[index].makerFeeRate }'),
              Text('${ accounts[index].minTxAmt }'),
              Text('${ accounts[index].minWithdraw }'),
              Text('${ accounts[index].name }'),
              Text('${ accounts[index].takerFeeRate }'),
              Text('${ accounts[index].withdrawFee }'),
              Text('${ accounts[index].withdrawStatus }'),*/
            ],
          );
        },
    );
  }
}


class Account {
  final String depositStatus;
  final String fullName;
  final String makerFeeRate;
  final String minTxAmt;
  final String minWithdraw;
  final String name;
  final String takerFeeRate;
  final String withdrawFee;
  final String withdrawStatus;

  Account(
    this.depositStatus,
    this.fullName,
    this.makerFeeRate,
    this.minTxAmt,
    this.minWithdraw,
    this.name,
    this.takerFeeRate,
    this.withdrawFee,
    this.withdrawStatus,
  );

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['depositStatus'],
      json['fullName'],
      json['makerFeeRate'],
      json['minTxAmt'],
      json['minWithdraw'],
      json['name'],
      json['takerFeeRate'],
      json['withdrawFee'],
      json['withdrawStatus'],
    );
  }
}