import 'package:flutter/material.dart';
import 'package:debut_flutter/demos/01_wechat_reader/pages/content_page.dart';

class ReaderNavigator extends StatefulWidget {
  @override
  _ReaderNavigatorState createState() => _ReaderNavigatorState();
}

class _ReaderNavigatorState extends State<ReaderNavigator> {
  final _defaultMenuColor = Colors.grey;
  final _activeMenuColor = Colors.blue;
  int _currentMenuIndex = 0;

  final ContentPageController _contentPageController = ContentPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ContentPage(
            contentPageController: _contentPageController,
            onPageChanged: (int index) {
              setState(() {
                _currentMenuIndex = index;
              });
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            _buttomMenuItem('本周', Icons.folder, 0),
            _buttomMenuItem('分享', Icons.explore, 1),
            _buttomMenuItem('免费', Icons.donut_small, 2),
            _buttomMenuItem('长安', Icons.person, 3)
          ],
          currentIndex: _currentMenuIndex,
          showUnselectedLabels: true,
          selectedItemColor: _activeMenuColor,
          unselectedItemColor: _defaultMenuColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onMenuItemTapped),
    );
  }

  void _onMenuItemTapped(int index) {
    // 控制内容区域跳动到指定页面
    _contentPageController.jumpToPage(index);

    setState(() {
      _currentMenuIndex = index;
    });
  }

  _buttomMenuItem(String label, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultMenuColor),
        activeIcon: Icon(icon, color: _activeMenuColor),
        label: label);
  }
}
