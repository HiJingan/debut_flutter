import 'package:flutter/material.dart';

import 'package:debut_flutter/chapter_02/2.1_counter/counter.dart';
import 'package:debut_flutter/pages/default_page.dart';

// 应用入口
// Flutter应用中使用main函数作为程序的入口
// runApp方法功能是启动Flutter应用，它接受一个Widget参数
void main() => runApp(MyApp());

// MyAPP类代表Flutter应用，继承自StatelessWidget, 那么它本身也是一个Widget
// Flutter构建页面时，会调用组件的build方法
// MasterialAPP是Material库中提供的Flutter APP框架，通过它可以设置引用的名称、主题、语言、首页及路由列表等
// home为Flutter应用的首页
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debut Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _renderSpecifiedHome('2.1'),
    );
  }

  _renderSpecifiedHome(String chapter) {
    switch (chapter) {
      case '2.1':
        return Counter(title: 'Debut Flutter');
      default:
        return DefaultPage();
    }
  }
}
