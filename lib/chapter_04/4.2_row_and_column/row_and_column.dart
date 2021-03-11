import 'package:flutter/material.dart';

/*
 * 主轴和纵轴
 * 布局是水平方向，主轴就是水平，纵轴就是垂直
 * 布局是垂直方向，主轴就是垂直，纵轴就是水平
 *
 * 主轴对齐：MainAxisAlignment
 * 纵轴对齐：CrossAxisAlignment
 *
 * Row和Column都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度
 *
 */

class RowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('mainAxisAlignment: '), Text('center')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('mainAxisAlignment: '),
                  Text('spaceAround')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('mainAxisAlignment: '),
                  Text('spaceBetween')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('mainAxisAlignment: '),
                  Text('spaceEvenly')
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '主轴纵轴',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text('默认效果')
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '主轴纵轴',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text('纵轴上底部对齐')
                ],
              ),
              Text('hello')
            ],
          )),
    );
  }
}
