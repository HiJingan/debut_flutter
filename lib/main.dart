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
import 'package:debut_flutter/chapter_05/5.1_padding/padding_demo.dart';
import 'package:debut_flutter/chapter_05/5.2_restricted_container/restricted_container.dart';
import 'package:debut_flutter/chapter_05/5.3_decorated_box/decorated_box_demo.dart';
import 'package:debut_flutter/chapter_05/5.4_transform/transfrom_demo.dart';
import 'package:debut_flutter/chapter_05/5.5_container/container_demo.dart';
import 'package:debut_flutter/chapter_05/5.6_bar/home_page_01.dart';
import 'package:debut_flutter/chapter_05/5.6_bar/home_page_02.dart';
import 'package:debut_flutter/chapter_05/5.7_clip/clip_demo.dart';
import 'package:debut_flutter/chapter_06/6.2_single_child_scroll_view/single_child_scroll_view_demo.dart';
import 'package:debut_flutter/chapter_06/6.3_list_view/list_view_demo.dart';
import 'package:debut_flutter/chapter_06/6.3_list_view/list_view_loading.dart';
import 'package:debut_flutter/chapter_06/6.4_grid_view/grid_view_demo.dart';
import 'package:debut_flutter/chapter_06/6.6_scroll_controller/scroll_controller_demo.dart';
import 'package:debut_flutter/chapter_06/6.5_custom_scroll_view/custom_scroll_view_demo.dart';

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
  'chapter_05_5_1_padding': (context) => PaddingDemo(),
  'chapter_05_5_2_restricted_container': (context) => RestrictedContainer(),
  'chapter_05_5_3_decorated_box': (context) => DecoratedBoxDemo(),
  'chapter_05_5_4_transform': (context) => TransfromDemo(),
  'chapter_05_5_5_container': (context) => ContainerDemo(),
  'chapter_05_5_6_home_bar_01': (context) => HomePage01(),
  'chapter_05_5_6_home_bar_02': (context) => HomePage02(),
  'chapter_05_5_7_clip': (context) => ClipDemo(),
  'chapter_06_6_2_single_child_scroll_view': (context) =>
      SingleChildScrollViewDemo(),
  'chapter_06_6_3_list_view': (context) => ListViewDemo(),
  'chapter_06_6_3_list_view_loading': (context) => ListViewLoading(),
  'chapter_06_6_4_grid_view': (context) => GradViewDemo(),
  'chapter_06_6_5_custom_scroll_view': (context) => CustomScrollViewDemo(),
  'chaptre_06_6_6_scroll_controller': (context) => ScrollControllerDemo(),
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
