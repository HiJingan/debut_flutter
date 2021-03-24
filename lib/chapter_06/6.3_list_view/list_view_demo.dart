import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    // 下划线Widget定义
    Widget divideRed = Divider(color: Colors.red);
    Widget divideGreen = Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // ListView基本用法
      // body: ListView(
      //   shrinkWrap: true, // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
      //   padding: const EdgeInsets.all(16),
      //   children: <Widget>[
      //     const Text('A'),
      //     const Text('B'),
      //     const Text('C'),
      //     const Text('D'),
      //     const Text('E'),
      //   ],
      // )

      // ListView.builder()
      // body: ListView.builder(
      //     itemCount: 100, // itemCount 列表项数量，如果为null，则为无限列表
      //     itemExtent: 50, // 每一个列表项高度
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(title: Text('$index'));
      //     }),

      // ListView.separated()
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          },
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divideRed : divideGreen;
          },
          itemCount: 100),
    );
  }
}
