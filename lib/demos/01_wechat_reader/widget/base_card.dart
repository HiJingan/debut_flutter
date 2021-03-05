import 'package:flutter/material.dart';

/*
 * 卡片基类
 */
class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottomHintColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      // 裁切圆角
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias, // 抗锯齿
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          topContent(),
          bottomContent(),
        ]),
      ),
    );
  }

  Widget topContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 26, 20, 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              topTitle(''),
              topTitleHint(''),
            ],
          ),
          subTitle('')
        ],
      ),
    );
  }

  Widget bottomContent() {
    return Container();
  }

  Widget subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          color: subTitleColor,
        ),
      ),
    );
  }

  Widget topTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget topTitleHint(String hint) {
    return Container();
  }

  Widget bottomHint(String hint) {
    return Text(
      hint,
      style: TextStyle(fontSize: 12, color: bottomHintColor),
    );
  }
}
