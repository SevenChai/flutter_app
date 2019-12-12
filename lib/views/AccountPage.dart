import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../components/LoadingDialog.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountPageState();
  }
}

class AccountPageState extends State<AccountPage> {
  List<Account> _accounts = <Account>[];

  bool _isShowDialog = false;
  void closeDialog() {
    if (mounted && _isShowDialog){
      _isShowDialog = false;
      Navigator.pop(context);
    }
  }
  //SimpleDialog
  void _showLoading() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog){
      _isShowDialog = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder:(_) {
            return WillPopScope(
              onWillPop: () async {
                // 拦截到返回键，证明dialog被手动关闭
                _isShowDialog = false;
                return Future.value(true);
              },
              child: LoadingDialog(text: '数据加载中...'),
            );
          }
      );
    }
  }

  void _hideLoading() {
    Navigator.pop(context);
  }

  Future<http.Response> getAccountList() async {
    final res = await http
        .get('https://global-openapi.bithumb.pro/openapi/v1/spot/config');
    _hideLoading();
    if (res.statusCode == 200) {
      List<Account> _accData = [];
      final data = json.decode(res.body);
      final coinConfig = data['data']['coinConfig'];
      for (int i = 0; i < coinConfig.length; i++) {
        _accData.add(Account.fromJson(coinConfig[i]));
      }
      setState(() {
        _accounts = _accData;
      });
    } else {
      print('error');
    }
    return res;
  }

  @override
  void initState() {
    // TODO: implement initState
    //页面初始化
    super.initState();
    Future.delayed(Duration.zero, () {
      _showLoading();
    });
    /*Timer t = Timer(Duration(seconds: 1), () {
      _showLoading();
    });
    // and later, before the timer goes off...
    t.cancel();*/
    getAccountList();
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
    return AccountList(
      accounts: _accounts,
    );
  }
}

class AccountList extends StatelessWidget {
  final List<Account> accounts;
  AccountList({Key key, @required this.accounts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Container(
                  width: 80.0,
                  child: Text('标题1'),
                ),
                Container(
                  width: 80.0,
                  child: Text('标题2'),
                ),
                Container(
                  width: 80.0,
                  child: Text('标题3'),
                ),
                Expanded(
                  child: Container(
                    child: Text('标题4'),
                  ),
                ),
                Container(
                  width: 40.0,
                  child: Text('标题5'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: accounts.map((acc) {
                  return Row(
                    children: <Widget>[
                      Container(
                        width: 80.0,
                        child: Text('${acc.name}'),
                      ),
                      Container(
                        width: 80.0,
                        child: Text('${acc.withdrawFee}'),
                      ),
                      Container(
                        width: 80.0,
                        child: Text('${acc.minTxAmt}'),
                      ),
                      Expanded(
                        child: Container(
                          child: Text('${acc.fullName}'),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        child: Text('${acc.depositStatus}'),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Account {
  final String depositStatus;
  final String fullName;
  final String minTxAmt;
  final String minWithdraw;
  final String name;
  final String withdrawFee;
  final String withdrawStatus;

  Account(
    this.depositStatus,
    this.fullName,
    this.minTxAmt,
    this.minWithdraw,
    this.name,
    this.withdrawFee,
    this.withdrawStatus,
  );

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['depositStatus'],
      json['fullName'],
      json['minTxAmt'],
      json['minWithdraw'],
      json['name'],
      json['withdrawFee'],
      json['withdrawStatus'],
    );
  }
}
