import 'package:flutter/material.dart';

/*
 * CustomScrollView 是可以使用 Sliver 来自定义滚动模型的组件
 *
 * Sliver 有细片、薄片之意，在Flutter中，Sliver通常指的是可以
 * 滚动的子元素（就像一个个薄片一样）
 *
 * CustomScrollView的子组件必须是Sliver
 */

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar
          SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Demo'),
                  background: Image.asset(
                      'assets/images/chapter_06/banner-cat.jpeg',
                      fit: BoxFit.cover))),

          // Padding
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4),
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // 创建子Widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              }, childCount: 20),
            ),
          ),

          // List
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              // 创建列表项
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
