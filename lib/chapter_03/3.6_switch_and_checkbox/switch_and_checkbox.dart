import 'package:flutter/material.dart';

class SwitchAndCheckbox extends StatefulWidget {
  @override
  _SwitchAndCheckboxState createState() {
    return new _SwitchAndCheckboxState();
  }
}

class _SwitchAndCheckboxState extends State<SwitchAndCheckbox> {
  bool _switchSelected = false; // 单选开关状态
  bool _checkboxSelected = false; // 复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('单选开关和复选框')),
        body: Column(children: <Widget>[
          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
          Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red,
              onChanged: (value) => {
                    setState(() => {_checkboxSelected = value})
                  })
        ]));
  }
}
