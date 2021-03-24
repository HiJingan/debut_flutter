import 'package:flutter/material.dart';

/*
 * SliverGridDelegateWithFixedCrossAxisCount
 * 该子类实现了一个横轴为固定数量子元素的layout算法
 */
class GradViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 横轴三个子Widget
              childAspectRatio: 1.0 // 子元素在横轴长度和主轴长度的比例
              ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.wb_sunny),
            Icon(Icons.wb_sunny_outlined),
            Icon(Icons.wb_cloudy),
            Icon(Icons.wb_cloudy_outlined),
            Icon(Icons.wb_incandescent),
            Icon(Icons.wb_incandescent_outlined),
            Icon(Icons.call_end),
          ],
        ));
  }
}
