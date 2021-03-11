import 'package:flutter/material.dart';

// flutter_spinkit提供了多种风格的模糊进度指示器
// https://pub.flutter-io.cn/packages/flutter_spinkit

class ProcessIndicator extends StatefulWidget {
  @override
  _ProcessIndicatorState createState() => new _ProcessIndicatorState();
}

class _ProcessIndicatorState extends State<ProcessIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // 动画执行3s
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(children: <Widget>[
            // 模糊进度条 会执行一个动画
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.orange),
              ),
            ),
            // 进度条固定显示50%
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.orange),
                value: .5,
              ),
            ),
            // 圆形进度条 会执行一个旋转动画
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.orange),
              ),
            ),
            // 圆形进度条固定展示50%
            Container(
                margin: EdgeInsets.only(bottom: 24),
                child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    value: .5)),
            // 进度色动画，3s内从灰色编程桔色的动画
            // 此demo有问题 待学到动画章节再来解决
            // Container(
            //     margin: EdgeInsets.only(bottom: 24),
            //     child: LinearProgressIndicator(
            //       backgroundColor: Colors.grey,
            //       valueColor: ColorTween(begin: Colors.grey, end: Colors.orange)
            //           .animate(_animationController),
            //       value: _animationController.value,
            //     ))
          ]),
        ));
  }
}
