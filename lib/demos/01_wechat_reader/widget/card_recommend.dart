import 'package:flutter/material.dart';
import 'package:debut_flutter/demos/01_wechat_reader/widget/base_card.dart';

class CardRecommend extends BaseCard {
  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  Widget topTitle(String title) {
    return super.topTitle('本周推荐');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('2月第4期已更新 · 每周更新');
  }

  @override
  Widget bottomContent() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 16),
      child: Image.network(
        'http://www.devio.org/io/flutter_beauty/card_1.jpg',
        fit: BoxFit.cover, // 无效果 why？
        width: double.infinity,
        height: double.infinity,
      ),
    ));
  }
}
