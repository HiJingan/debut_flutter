import 'package:flutter/material.dart';

/*
 * 层叠布局
 *
 * 它和Web中的绝对定位，Android中的Frame布局是相似的，子组件可以根据父容器四个角的位置来确定自身的位置
 * 绝对定位允许子组件堆叠起来（按照代码的声明顺序）
 *
 * Stack允许子组件堆叠
 * Positioned用于更具Stack的四个角来确定子组件的位置
 */
class StackAndPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Text('hello world'),
              ),
              Positioned(left: 18, child: Text('This is Positioned')),
              Positioned(bottom: 6, child: Text('绝对定位')),
              Positioned(bottom: 14, child: Text('可以重叠'))
            ],
          ),
        ));
  }
}
