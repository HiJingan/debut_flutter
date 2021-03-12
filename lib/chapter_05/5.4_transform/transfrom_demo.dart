import 'package:flutter/material.dart';
import 'dart:math' as math;

/*
 * Transform
 * 可以再其子组件绘制时对其应用一些矩阵变换来实现一些效果
 *
 * Matrix4 是一个4D矩阵，可以利用它来实现各种矩阵操作
 *
 * 矩阵的变化只会作用于绘制节点，所以可以通过矩阵变化来改变UI，而不需要重新出发build流程，这样会节省layout的开销，性能较好
 *
 * RotatedBox 和 Transform.rotate功能相似，都可以实现对子组件进行旋转变换
 * RotatedBox 变换是layout阶段，会影响在子组件的位置和大小
 *
 */

class TransfromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: new Transform(
                  transform: new Matrix4.skewY(0.3),
                  alignment: Alignment.topRight,
                  child: new Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.orange,
                      child: const Text('this is transform')),
                ),
              ),
              // 平移
              Container(
                margin: EdgeInsets.only(top: 24),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.translate(
                        offset: Offset(-10, -5),
                        child: Text('tranform: translate'))),
              ),
              // 旋转
              Container(
                  margin: EdgeInsets.only(top: 64),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Transform.rotate(
                          angle: math.pi / 2,
                          child: Text('transfrom: rotate')))),
              // 缩放
              Container(
                  margin: EdgeInsets.only(top: 64),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Transform.scale(
                      scale: 0.5,
                      child: Text('transfrom: scale'),
                    ),
                  )),
              // 对子组件先旋转再平移、先平移再旋转的区别
              // 先旋转再平移
              Container(
                  margin: EdgeInsets.only(top: 64),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Transform.translate(
                      offset: Offset(-10, 0),
                      child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Text('translate -> rotate')),
                    ),
                  )),
              // 先平移再旋转
              Container(
                  margin: EdgeInsets.only(top: 64),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: Transform.translate(
                          offset: Offset(-10, 0),
                          child: Text('rotate -> translate')),
                    ),
                  ))
            ],
          )),
    );
  }
}
