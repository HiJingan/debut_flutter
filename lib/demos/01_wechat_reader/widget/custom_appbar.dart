import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top; // 刘海屏顶部安全区域

    return Container(
      margin: EdgeInsets.fromLTRB(20, paddingTop + 10, 20, 5),
      padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white60,
      ),
      child: Row(children: <Widget>[
        Icon(Icons.search, color: Colors.grey, size: 16),
        Expanded(
            child: Text('长安十二时辰',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ))),
        Container(
            width: 1,
            height: 20,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(color: Colors.grey)),
        Text(
          '书城',
          style: TextStyle(fontSize: 13),
        )
      ]),
    );
  }
}
