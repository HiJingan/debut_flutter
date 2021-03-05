import 'package:debut_flutter/demos/01_wechat_reader/widget/base_card.dart';
import 'package:flutter/material.dart';

class CardShare extends BaseCard {
  @override
  _CardShareState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState {
  @override
  Widget topTitle(String title) {
    return super.topTitle('热门分享');
  }

  @override
  topTitleHint(String hint) {
    return Padding(
        padding: EdgeInsets.only(left: 8, bottom: 4),
        child: Text(
          '/ 第16期',
          style: TextStyle(
            fontSize: 12,
          ),
        ));
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('邀请朋友得无限卡');
  }

  @override
  Widget bottomContent() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(color: Color(0xfff6f7f9)),
      child: Column(children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 20, right: 15, bottom: 20, left: 15),
          child: Image.network(
            'http://www.devio.org/io/flutter_beauty/card_list.png',
            fit: BoxFit
                .cover, // flutter即是设置了BoxFit.cover 图片仍然不满屏的问题：添加下面width和height
            width: double.infinity,
            height: double.infinity,
          ),
        )),
        Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: bottomHint('122434人 · 参与活动'))
      ]),
    ));
  }
}
