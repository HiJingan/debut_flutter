import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('按钮')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(children: <Widget>[
              _renderButtonCard(
                  'ElevatedButton: 默认带有阴影和灰色背景，按下后阴影会变大',
                  ElevatedButton(
                      onPressed: () {}, child: Text('ElevatedButton'))),
              _renderButtonCard('TextButton: 文字按钮，默认背景透明并不带阴影，按下后会有背景色',
                  TextButton(onPressed: () {}, child: Text('TextButton'))),
              _renderButtonCard(
                  'OutlineButton: 默认有一个边框，不带阴影且背景透明，按下后边框颜色变亮，同时出现背景和阴影',
                  OutlinedButton(
                      onPressed: () {}, child: Text('OutlineButton'))),
              _renderButtonCard('IconButton: 是一个可单击的icon',
                  IconButton(icon: Icon(Icons.thumb_up), onPressed: () {})),
              _renderButtonCard(
                  '带图标的按钮',
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Raised Button with icon'),
                  )),
              _renderButtonCard(
                  '自定义按钮外观',
                  TextButton(
                    onPressed: () {},
                    child: Text('提交'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red)),
                    // TODO: TextButton如何实现原FlatButton按钮样式 ？

                    // 原FlatButton(Flutter V1)定义方式
                    // color: Colors.blue,
                    // highlightColor: Colors.blue[700], // 按下时背景色
                    // colorBrightness: Brightness.dark, // 按钮主题，默认是浅色主题
                    // splashColor: Colors.grey, // 按下时，水波动画中水波的颜色
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)), // 外形
                  ))
            ])));
  }

  Widget _renderButtonCard(String description, Widget button) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(children: <Widget>[Text(description), button]),
    );
  }
}
