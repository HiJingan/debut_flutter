import 'package:debut_flutter/chapter_02/2.2_route_management/new_route.dart';
import 'package:debut_flutter/chapter_02/2.2_route_management/tip_route.dart';
import 'package:flutter/material.dart';

class RouteManagement extends StatefulWidget {
  @override
  _RouteManagementState createState() {
    return _RouteManagementState();
  }
}

class _RouteManagementState extends State<RouteManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('route example')),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              'router example',
              style: TextStyle(fontSize: 24),
            ),
            // 跳转到新路由页面按钮
            FlatButton(
              child: Text('打开新页面'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewRoute(),
                        fullscreenDialog: false));
              },
            ),
            // 非命名路由的传值
            FlatButton(
                child: Text('非命名的路由传参'),
                textColor: Colors.green,
                onPressed: _jumpToNewPageWithParams)
          ])),
    );
  }

  void _jumpToNewPageWithParams() async {
    // 打开`TipRoute`，并等待返回结果
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TipRoute(text: '我是push路由时传入的数据')));
    print(result);
  }
}

/*
 * MaterialPageRoute
 * MaterialPageRoute继承自PageRoute类，PageRoute是一个抽象类，它表示占有整个屏幕空间的一个模态路由页面
 *
 * Navigator
 * Navigator是一个路由管理的组件，提供了打开和退出路由页的方法。它通过栈来管理路由集合，当前屏幕显示的就是栈顶的路由
 *
 * 非命名路由
 *
 * 命名路由
 *
 * 路由生成钩子 MaterialApp有一个onGenerateRoute属性，可以做一些全局的路由跳转前置处理逻辑
 */
