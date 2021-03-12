import 'package:flutter/material.dart';

/*
 * 剪裁函数，用于对组件进行剪裁
 * ClipOval 子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
 * ClipRRect 将子组件剪裁为圆角矩形
 * ClipRect 剪裁子组件到实际占用大小（溢出部分剪裁）
 */
class ClipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;
    Widget avatar =
        Image.asset('assets/images/chapter_05/avatar.png', width: 60);

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Column(children: <Widget>[
          avatar, // 不剪裁
          ClipOval(child: avatar), // 剪裁为原形
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: avatar), // 剪裁为圆角矩形
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, // 宽度设置为原来的一半，另一半会溢出
                  child: avatar),
              Text('溢出测试-不剪裁')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, // 宽度设置为原来的一半，另一半会溢出
                    child: avatar),
              ),
              Text('溢出测试-溢出部分剪裁')
            ],
          )
        ])));
  }
}
