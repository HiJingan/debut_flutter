import 'package:flutter/material.dart';

/*
 * 尺寸限制类容器
 * 用于限制容器的大小
 * ConstrainedBox、SizedBox、UnconstainedBox、AspectRatio等
 *
 * ConstrainedBox 用于对子组件添加额外的约束
 *
 * BoxConstraints 用于设置限制条件 minWidth maxWidth minHeight minWidth
 *
 * SizedBox 用于给子组件指定固定的宽高
 *
 * UnconstrainedBox 不会对子组件产生任何限制，它允许子组件按照其本身大小绘制
 *
 * 实际开发中，我们已经使用SizedBox或者ConstrainedBox给子元素指定的宽高，但是无效，
 * 可以考虑是不是有父元素限制了尺寸
 *
 * 实例： AppBar是父组件，它限制了actions按钮的大小，如果要自定义，则需要通过UnconstrainedBox
 *
 * 其他限制类容器
 * AspectRatio 可以指定子组件的长宽比
 * LimitedBox 指定最大宽高
 * FractionallySizedBox 根据父容器宽高的百分比来设置子组件的宽高
 *
 */
class RestrictedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    Widget orangeBox =
        DecoratedBox(decoration: BoxDecoration(color: Colors.orange));

    Widget yellowBox =
        DecoratedBox(decoration: BoxDecoration(color: Colors.yellow));

    Widget greenBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.green),
      child: Text('xxxx  xxxx'),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            UnconstrainedBox(
                child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(Colors.white70))))
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 虽然将Container设置5像素的高度，但最终显示50
              // 就是ConstrainedBox的对子组件最小高度设置生效了
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, // 宽度尽可能大
                    minHeight: 50 // 最小高度为50像素
                    ),
                child: Container(height: 5, child: redBox),
              ),
              // SizedBox
              SizedBox(height: 100, width: 100, child: orangeBox),
              // SizedBox 等价于如下
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100, height: 100),
                child: yellowBox,
              ),
              // 多重限制
              // 如果一个组件有多个父级ConstrainedBox限制，那么会是哪个会生效？
              // 有多重限制时
              // 对于minWidth minHeight,是取父级中较大的值
              // 对于maxWidth maxHeight,是取父级中较小的值
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 15, maxHeight: 15),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 30, maxHeight: 30),
                    child: greenBox,
                  )),
              // UnconstrainedBox
              // UnconstrainedBox对父组件的去除，并非真正的去除
              // 红色为30 * 30, 但是上方任由70的空白空间，父元素的minHeight(100)是生效的，
              // 只不过它不影响redbox的大小，但任然占据本身的空间
              ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 100, minHeight: 100), // 父级的限制
                  child: UnconstrainedBox(
                      // '去除'父级的限制
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth: 30, minHeight: 30), // 子级的限制
                          child: redBox)))
            ]));
  }
}
