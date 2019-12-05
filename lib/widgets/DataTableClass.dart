import 'package:flutter/material.dart';
import '../components/returnHomePage.dart';

class DataTableClassSevenor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataTableState();
  }
}
class DataTableState extends State<DataTableClassSevenor>{
  List<Shop> _shops = <Shop>[
    Shop('商品1', 100,  '手机',  1500.0 ),
    Shop('商品2', 100,  '家电',  3500.0 ),
    Shop('商品3', 100,  '手机',  1500.0 ),
  ];
  List<DataColumn> getColumn(){
    return [
      DataColumn(label: Text('名称')),
      DataColumn(label: Text('库存')),
      DataColumn(label: Text('类型')),
      DataColumn(label: Text('价格')),
    ];
  }
  //选中一行
  void _selectOne(index, isSelected){
    setState(() {
      print(index);
      _shops[index].selected = isSelected;
    });
  }
  DataRow _getRow(Shop shop, int index){
    print(index);
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(shop.name)),
        DataCell(Text('${shop.price}')),
        DataCell(Text('${shop.number}')),
        DataCell(Text(shop.type)),
      ],
      selected: shop.selected,
      onSelectChanged: (bool isSelected){
        _selectOne(index, isSelected);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    int _tableIndex = -1;
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
          child: ReturnToHome(), preferredSize: Size.fromHeight(50)),
      body: DataTable(
        columns: getColumn(),
        /*rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('名字'),
                ),
                DataCell(
                  Text('库存'),
                ),
                DataCell(
                  Text('类型'),
                ),
                DataCell(
                  Text('价格'),
                ),
              ]
            ),
          ],*/
        rows: _shops.map((shop){
          _tableIndex ++;
          return _getRow(shop, _tableIndex);
        }).toList(),
      ),
    );
  }
}
class Shop{
  final String name;
  final int number;
  final String type;
  final double price;
  bool selected = false;
  Shop(
      this.name,
      this.number,
      this.type,
      this.price,
      );
}
