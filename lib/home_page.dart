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
      {'label': '2.1 计数器应用示例', 'routeName': 'chapter_02_2_1_counter'},
      {'label': '2.2 路由管理', 'routeName': 'chapter_02_2_2_route_management'},
      {'label': '3.3 文本及样式', 'routeName': 'chapter_03_3_3_text'},
      {'label': '3.4 按钮', 'routeName': 'chapter_03_3_4_button'},
      {'label': '3.5 图片及icon', 'routeName': 'chapter_03_3_5_image_and_icon'},
      {
        'label': '3.6 单选开关和复选框',
        'routeName': 'chapter_03_3_6_switch_and_checkbox'
      },
      {'label': '3.7 输入框', 'routeName': 'chapter_03_3_7_textfield'},
      {'label': '3.7 表单', 'routeName': 'chapter_03_3_7_form'},
      {'label': '3.8 进度指示器', 'routeName': 'chapter_03_3_8_process_indicator'},
      {
        'label': '4.2 线性布局(Row和Column)',
        'routeName': 'chapter_04_4_2_row_and_column'
      },
      {'label': '4.3 弹性布局(Flex)', 'routeName': 'chapter_04_4_3_flex'},
      {
        'label': '4.4 流式布局(Wrap和Flow)',
        'routeName': 'chapter_04_4_4_wrap_and_flow'
      },
      {
        'label': '4.5 层叠布局(Stack和Positioned)',
        'routeName': 'chapter_04_4_5_stack_and_positioned'
      },
      {'label': '4.6 对齐与相对定位(Align)', 'routeName': 'chapter_04_4_6_align'},
      {'label': '5.1 填充(Padding)', 'routeName': 'chapter_05_5_1_padding'},
      {
        'label': '5.2 尺寸限制类容器',
        'routeName': 'chapter_05_5_2_restricted_container'
      },
      {
        'label': '5.3 装饰容器(DecoratedBox)',
        'routeName': 'chapter_05_5_3_decorated_box'
      },
      {'label': '5.4 变换(Transfrom)', 'routeName': 'chapter_05_5_4_transform'},
      {'label': '5.5 Container', 'routeName': 'chapter_05_5_5_container'},
      {
        'label': '5.6 首页框架01',
        'routeName': 'chapter_05_5_6_home_bar_01',
      },
      {
        'label': '5.6 首页框架02',
        'routeName': 'chapter_05_5_6_home_bar_02',
      },
      {
        'label': '5.7 剪裁(Clip)',
        'routeName': 'chapter_05_5_7_clip'
      },
      {'label': 'demo_01 微信读书卡片布局', 'routeName': 'demo_01_wechat_reader'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: _renderList()));
  }

  Widget _renderList() {
    List<Widget> list = [];
    Widget content;

    routeList.forEach((item) {
      list.add(new Row(children: <Widget>[
        new TextButton(
          child: Text(item['label']),
          onPressed: () {
            Navigator.pushNamed(context, item['routeName'],
                arguments: item['label']);
          },
        )
      ]));
    });

    content = new Column(children: list);

    return content;
  }
}
