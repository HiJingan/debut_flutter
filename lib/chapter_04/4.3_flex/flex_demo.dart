import 'package:flutter/material.dart';

/*
 * 弹性盒子布局可以让子组件按照一定的比例来分配父容器的空间
 *
 * Flex组件可以沿着水平或者垂直方向排列组件，Row和Column都继承自Flex
 */
class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(children: <Widget>[
          // Flex的两个子Widget按1:2来分配水平空间
          Flex(direction: Axis.horizontal, children: <Widget>[
            Expanded(
                flex: 1, child: Container(height: 30, color: Colors.green)),
            Expanded(
                flex: 2, child: Container(height: 30, color: Colors.blue[700]))
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
                height: 100,
                // Flex的三个字Widget，在垂直方向按2:1:1来分配100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(flex: 2, child: Container(color: Colors.red)),
                    // Spacer(flex: 1),
                    Expanded(flex: 1, child: Container(color: Colors.orange)),
                    Expanded(flex: 1, child: Container(color: Colors.yellow))
                  ],
                )),
          )
        ]));
  }
}
