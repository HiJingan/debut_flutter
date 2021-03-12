import 'package:flutter/material.dart';

/*
 * DecoratedBox
 * 装饰容器可以再其子组件绘制前（或后）绘制一些装饰，如背景、边框、渐变等
 *
 * const DecoratedBox({
 *   Decoration decoration, // 代表将要绘制的装饰
 *   DecorationPosition position = DecorationPosition.background, // background，在子组件之后绘制，背景装饰；foreground，在子组件之上绘制，前景
 *   Widget child
 * })
 *
 * BoxDecotation
 * 它是Decoration的子类
 */
class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child:
                // 实现一个带阴影的背景色渐变按钮
                DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange[700]]), // 背景色渐变
                        borderRadius: BorderRadius.circular(4), // 圆角
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2, 2),
                              blurRadius: 4) // 阴影
                        ]),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                        child: Text("Submit",
                            style: TextStyle(color: Colors.white))))));
  }
}
