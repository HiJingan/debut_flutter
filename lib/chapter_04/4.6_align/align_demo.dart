import 'package:flutter/material.dart';

/*
 * 通过Stack和Positioned，可以指定一个或多个子元素相对父元素各个边的便宜
 *
 * 如果只是想简单的调整一个子元素在父元素中的位置，可以使用Align
 *
 * Align和Stack对比？
 * 相同点：都可以用作指定子元素相对父元素的偏移
 * 不同点：
 *  1. 定位参考不同
 *        Stack/Positioned定位的参考是父容器Stack的四个顶点；
 *        Align先是通过aligment参数来确定坐标原点，最终的偏移是通过alignment的转换公式计算得出
 *  2. Stack 可以有多个子元素且可以堆叠，ALign只能有一个子元素
 *
 * Alignment继承自AlignmentGeometry，表示矩形内的一个点，属性：x和y，分别表示水平和垂直方向的偏移
 *
 * Alignment Widget会以矩形的中心点作为坐标原点 Alignment(0, 0) x、y的取值为-1 - 1
 * // TODO: 这里可以深入学习
 *
 * Center组件继承自Align组件
 */

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 120,
              width: 120,
              color: Colors.green[100],
              child: Align(
                  alignment: Alignment.topLeft, child: Text('Align Widget'))),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Center(child: Text('center')),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child:
                Center(widthFactor: 1, heightFactor: 1, child: Text('center')),
          )
        ],
      ),
    );
  }
}
