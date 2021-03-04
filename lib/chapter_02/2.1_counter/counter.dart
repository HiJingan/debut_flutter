// 导入Material UI组件库，Flutter默认提供了一套丰富的Material风格的UI组件
// Material是一套标准的移动端和web端的视觉设计语言，官网：https://material.io/design
import 'package:flutter/material.dart';

// StatefulWidget 有状态的组件
// StatelessWideget 无状态组件
// 区别：
// 1. Stateful widget可以拥有状态，状态在widget的生命周期中可变，Stateless widget是不可变的
// 2. Stateful widget至少由两个类组成：一个StatefulWidget类和一个State类

class Counter extends StatefulWidget {
  Counter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0; // 用于记录按钮被点击的次数

  // setState方法的作用是通知Flutter框架，有状态发生了变化，框架收到通知后，会执行build方法来根据新的状态重新构建界面
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Scaffold是Material库中提供的页面脚手架，提供默认的导航栏、标题、和包含主屏幕的widget树的body属性
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直方向居中
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/**
 * 为什么要将build方法放在State中，而不是放在StatefulWidget中?
 *
 * 这主要是为了提高开发的灵活性。如果将build()方法放在StatefulWidget中则会有两个问题：
 *
 * 1. 访问状态不方便
 * 2. 继承StatefulWidget不便
 */
