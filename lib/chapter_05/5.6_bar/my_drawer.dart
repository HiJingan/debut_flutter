import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true, // 移除抽屉菜单顶部默认留白
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/chapter_05/avatar.png',
                              width: 60,
                            ),
                          )),
                      Text(
                        'hi Jingan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Expanded(
                  child: ListView(children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account')),
                ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'))
              ]))
            ],
          )),
    );
  }
}
