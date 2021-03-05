import 'package:flutter/material.dart';

// chapter
import 'package:debut_flutter/chapter_02/2.1_counter/counter.dart';
import 'package:debut_flutter/pages/default_page.dart';

// demos
import 'package:debut_flutter/demos/01_wechat_reader/reader_navigator.dart';

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
      home: _renderSpecifiedHome('demo_01_wechat_reader'),
    );
  }

  /*
   * 渲染指定的首页
   *
   * chapter_2.1               Flutter官方第一个示例，计数器
   *
   * demo_01_wechat_reader     微信读书简易版示例，导航组件与对应的页面卡片同步切换
   */
  _renderSpecifiedHome(String chapter) {
    switch (chapter) {
      case 'chapter_2.1':
        return Counter(title: 'Debut Flutter');
      case 'demo_01_wechat_reader':
        return ReaderNavigator();
      default:
        return DefaultPage();
    }
  }
}
