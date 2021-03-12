import 'package:flutter/material.dart';

/*
 * Padding 可以给其子元素添加填充（留白）
 *
 * EdgeInsets
 * fromLTRB
 * all
 * only
 * symmetric 用于设置对称方向 vertical 指 top 和 bottom，horizontal 值 left 和 right
 */
class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text('EdgeInsets.only(top: 24)'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text('EdgeInsets.symmetric(vertical: 6)'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 48, 16, 24),
                child: Text('EdgeInsets.fromLTRB(8, 48, 16, 24)'),
              )
            ],
          ),
        ));
  }
}
