import 'package:debut_flutter/chapter_04/4.4_wrap_and_flow/test_flow_delegate.dart';
import 'package:flutter/material.dart';

/*
 * 使用Row或者Column时，如果子Widget超出屏幕范围，则会溢出错误
 *
 * 线性布局: Row 和 Column，默认只有一行(列)，超出屏幕显示范围不会自动折行
 * 流式布局：超出屏幕显示范围会自动折行的布局
 *
 * Flow
 * 较少使用，需要自己实现子widget的位置转换
 */
class WrapAndFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: <Widget>[
            Wrap(
              spacing: 16,
              alignment: WrapAlignment.center,
              runSpacing: 4,
              children: [
                Text('hello world'),
                Text('hello world'),
                Text('hello world'),
                Text('hello world'),
                Text('hello world'),
                Text('hello world'),
              ],
            ),
            Wrap(
                spacing: 8, // 主轴（水平）方向间距
                // runSpacing: 4, // 纵轴（垂直）防线间距
                alignment: WrapAlignment.end, // 沿主轴方向居中
                children: <Widget>[
                  new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('F')),
                      label: new Text('Football')),
                  new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('B')),
                      label: new Text('Football')),
                  new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('P')),
                      label: new Text('Football')),
                  new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('B')),
                      label: new Text('Badminton')),
                  new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('G')),
                      label: new Text('Golf'))
                ]),
            Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
                children: <Widget>[
                  new Container(width: 80, height: 80, color: Colors.red),
                  new Container(width: 80, height: 80, color: Colors.orange),
                  new Container(width: 80, height: 80, color: Colors.yellow),
                  new Container(width: 80, height: 80, color: Colors.green),
                  new Container(width: 80, height: 80, color: Colors.cyan),
                  new Container(width: 80, height: 80, color: Colors.blue),
                ])
          ],
        ));
  }
}
