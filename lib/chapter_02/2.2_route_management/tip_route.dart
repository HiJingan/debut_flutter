import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('prompt')),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, '我是pop路由时返回的数据'),
              child: Text('返回'),
            )
          ],
        )));
  }
}
