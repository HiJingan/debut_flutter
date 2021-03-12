import 'package:flutter/material.dart';
import 'package:debut_flutter/chapter_05/5.6_bar/my_drawer.dart';

class HomePage01 extends StatefulWidget {
  @override
  _HomePage01State createState() {
    return new _HomePage01State();
  }
}

class _HomePage01State extends State<HomePage01>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController; // 定义一个tab controller
  List tabs = ['热门', '推荐', '关注'];

  @override
  void initState() {
    _tabController =
        TabController(length: tabs.length, vsync: this); // 创建controller
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // 顶部导航栏
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        // 自定义菜单图标（抽屉导航入口）
        // leading: Builder(builder: (context) {
        //   return IconButton(
        //       icon: Icon(Icons.dashboard),
        //       color: Colors.white,
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       });
        // }),
        bottom: TabBar(
            controller: _tabController, // 关联tab controller
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      // 抽屉导航
      drawer: new MyDrawer(),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 3,
              ),
            );
          }).toList()),
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School')
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
