import 'package:flutter/material.dart';

/*
 * SingleChildScrollView
 * 类似于Android中的ScrollView，只能接受一个子组件
 *
 * 通常，改组件应在期望的内容不会超过屏幕太多时使用，
 * 它不支持基于Sliver的延迟实例化模型，所以如果预计
 * 视口可能超出屏幕尺寸过多内容是，使用该组件会性能
 * 较差，可以使用ListView来替换
 *
 */
class SingleChildScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Scrollbar(
        // 显示滚动条
        child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Center(
                child: Column(
              children: str
                  .split('')
                  .map((i) => Text(i, textScaleFactor: 2))
                  .toList(),
            ))),
      ),
    );
  }
}
