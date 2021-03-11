import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List routeList;

  @override
  void initState() {
    routeList = [
      {
        'label': '2.1 计数器应用示例', //
        'routeName': 'chapter_02_2_1_counter'
      },
      {
        'label': '2.2 路由管理', //
        'routeName': 'chapter_02_2_2_route_management'
      },
      {
        'label': '3.3 文本及样式', //
        'routeName': 'chapter_03_3_3_text'
      },
      {
        'label': '3.4 按钮', //
        'routeName': 'chapter_03_3_4_button'
      },
      {
        'label': '3.5 图片及icon', //
        'routeName': 'chapter_03_3_5_image_and_icon'
      },
      {
        'label': '3.6 单选开关和复选框', //
        'routeName': 'chapter_03_3_6_switch_and_checkbox'
      },
      {
        'label': '3.7 输入框', //
        'routeName': 'chapter_03_3_7_textfield'
      },
      {
        'label': '3.7 表单', //
        'routeName': 'chapter_03_3_7_form'
      },
      {
        'label': '3.8 进度指示器', //
        'routeName': 'chapter_03_3_8_process_indicator'
      },
      {
        'label': 'demo_01 微信读书卡片布局', //
        'routeName': 'demo_01_wechat_reader'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: SingleChildScrollView(child: _renderList()));
  }

  Widget _renderList() {
    List<Widget> list = [];
    Widget content;

    routeList.forEach((item) {
      list.add(new Row(children: <Widget>[
        new TextButton(
          child: Text(item['label']),
          onPressed: () {
            Navigator.pushNamed(context, item['routeName']);
          },
        )
      ]));
    });

    content = new Column(children: list);

    return content;
  }
}
