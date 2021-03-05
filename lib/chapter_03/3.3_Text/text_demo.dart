import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('文本及样式')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello Flutter.',
                  textAlign: TextAlign.left,
                ),
                Text('Hello Flutter. ' * 6,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  'Hello Flutter. ',
                  textScaleFactor: 1.5, // 字体大小缩放因子
                ),
                Text('Text Style',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        height: 2, // 指定行高，是一个因子，实际的行高 = fontSize * height
                        fontFamily: 'Courier',
                        background: new Paint()..color = Colors.lightGreen,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red[300],
                        decorationStyle: TextDecorationStyle.dashed)),
                // 通过Text.rich 方法将TextSpan添加到Text中，之所以可以这样做，
                // 是因为Text其实就是RichText的一个包装，而RichText是可以显示多种样式(富文本)的widget
                Text.rich(TextSpan(children: [
                  TextSpan(text: 'next: '),
                  TextSpan(
                      text: 'TextSpan introduction',
                      style: TextStyle(color: Colors.green))
                ])),
                // DefaultStyle用于设置默认文本样式
                DefaultTextStyle(
                    style: TextStyle(color: Colors.red),
                    child: Column(
                      children: <Widget>[
                        Text('DefaultTextStyle 继承自父Widget的样式'),
                        Text(
                          'DefaultTextStyle 不继承父Widget的样式',
                          style: TextStyle(inherit: false, color: Colors.grey),
                        )
                      ],
                    ))
              ]),
        ));
  }
}
