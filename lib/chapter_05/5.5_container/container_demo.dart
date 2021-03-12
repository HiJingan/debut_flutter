import 'package:flutter/material.dart';

/*
 * Container
 * Containe是一个组合类容器，，它是DecoratedBox ConstrainedBox Transfrom Padding Align等组件组合的一个多功能容器
 *
 */
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 120),
              constraints: BoxConstraints.tightFor(width: 200, height: 120),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .9),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 4)
                  ]),
              transform: Matrix4.rotationZ(.2),
              alignment: Alignment.center,
              child: Text(
                'Container',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            )
          ],
        ));
  }
}
