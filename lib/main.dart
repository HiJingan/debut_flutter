import 'package:flutter/material.dart';

// home
import 'package:debut_flutter/home_page.dart';

// chapter
import 'package:debut_flutter/chapter_02/2.1_counter/counter.dart';
import 'package:debut_flutter/chapter_02/2.2_route_management/route_management.dart';
import 'package:debut_flutter/chapter_03/3.3_text/text_demo.dart';
import 'package:debut_flutter/chapter_03/3.4_button/button_demo.dart';
import 'package:debut_flutter/chapter_03/3.5_image_and_icon/image_and_icon.dart';
import 'package:debut_flutter/chapter_03/3.6_switch_and_checkbox/switch_and_checkbox.dart';
import 'package:debut_flutter/chapter_03/3.7_form/textfield_demo.dart';
import 'package:debut_flutter/chapter_03/3.7_form/form_demo.dart';
import 'package:debut_flutter/chapter_03/3.8_process_indicator/process_indicator.dart';
import 'package:debut_flutter/chapter_04/4.2_row_and_column/row_and_column.dart';
import 'package:debut_flutter/chapter_04/4.3_flex/flex_demo.dart';
import 'package:debut_flutter/chapter_04/4.4_wrap_and_flow/wrap_and_flow.dart';
import 'package:debut_flutter/chapter_04/4.5_stack_and_positioned/stack_and_positioned.dart';
import 'package:debut_flutter/chapter_04/4.6_align/align_demo.dart';

// demos
import 'package:debut_flutter/demos/01_wechat_reader/reader_navigator.dart';

final routes = {
  '/': (context) => HomePage(),
  'chapter_02_2_1_counter': (context) => Counter(),
  'chapter_02_2_2_route_management': (context) => RouteManagement(),
  'chapter_03_3_3_text': (context) => TextDemo(),
  'chapter_03_3_4_button': (context) => ButtonDemo(),
  'chapter_03_3_5_image_and_icon': (context) => ImageAndIcon(),
  'chapter_03_3_6_switch_and_checkbox': (context) => SwitchAndCheckbox(),
  'chapter_03_3_7_textfield': (context) => TextfieldDemo(),
  'chapter_03_3_7_form': (context) => FormDemo(),
  'chapter_03_3_8_process_indicator': (context) => ProcessIndicator(),
  'chapter_04_4_2_row_and_column': (context) => RowAndColumn(),
  'chapter_04_4_3_flex': (context) => FlexDemo(),
  'chapter_04_4_4_wrap_and_flow': (context) => WrapAndFlow(),
  'chapter_04_4_5_stack_and_positioned': (context) => StackAndPositioned(),
  'chapter_04_4_6_align': (context) => AlignDemo(),
  'demo_01_wechat_reader': (context) => ReaderNavigator(),
};

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
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // 注册路由表
        routes: routes);
  }
}
