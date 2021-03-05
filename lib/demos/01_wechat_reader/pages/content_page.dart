import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:debut_flutter/demos/01_wechat_reader/widget/card_listen.dart';
import 'package:debut_flutter/demos/01_wechat_reader/widget/card_recommend.dart';
import 'package:debut_flutter/demos/01_wechat_reader/widget/card_share.dart';
import 'package:debut_flutter/demos/01_wechat_reader/widget/custom_appbar.dart';

class ContentPage extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPageController contentPageController;

  // 构造方法
  const ContentPage({Key key, this.onPageChanged, this.contentPageController})
      : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  PageController _pageController = PageController(
      // 视窗比例
      viewportFraction: 0.8);

  // static List<Color> _contentColors = [
  //   Colors.orange,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.cyan
  // ];

  @override
  void initState() {
    _setImmesiveStatusBar();

    if (widget.contentPageController != null) {
      widget.contentPageController._pageController = _pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
            child: PageView(
          controller: _pageController,
          children: <Widget>[
            _contentPageItem(CardRecommend()),
            _contentPageItem(CardShare()),
            _contentPageItem(CardListen()),
            _contentPageItem(CardRecommend()),
          ],
          onPageChanged: widget.onPageChanged,
        ))
      ],
    );
  }

  Widget _contentPageItem(Widget widget) {
    return Padding(padding: EdgeInsets.all(10), child: widget);
  }

  // 状态栏样式 沉浸式状态栏
  _setImmesiveStatusBar() {
    // Immersive 沉浸的
    // 黑色沉浸式状态栏，基于 SystemUiOverlayStyle 的dark样式，修改statusBarColor为透明
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

// 内容区域的控制器
class ContentPageController {
  PageController _pageController;

  void jumpToPage(int index) {
    // 安全的调用 ?.
    _pageController?.jumpToPage(index);
  }
}
