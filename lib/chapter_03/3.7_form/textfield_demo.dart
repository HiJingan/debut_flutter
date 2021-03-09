import 'package:flutter/material.dart';

/*
 * 获取输入内容：
 * 方式一：定义变量，然后在onChange触发时，各种保存一下输入内容
 * 方式二：通过controller直接获取（下面示例用此方式）
 *
 * 监听文本变化
 * 方式一：设置onChange回调
 * 方式二：通过controller监听
 * 两种方式的差异：
 * onChange是专门用于监听文本变化；
 * controller除了可以监听文本变化，还可以设置默认值、选择文本等
 *
 * 焦点控制
 * 焦点控制通过FocusNode和FocusScopeNode来控制
 */

class TextfieldDemo extends StatefulWidget {
  @override
  _TextfieldDemoState createState() => new _TextfieldDemoState();
}

class _TextfieldDemoState extends State<TextfieldDemo> {
  // 定义一个controller
  TextEditingController _usernameController = TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // 监听输入改变
    _usernameController.addListener(() {
      print(_usernameController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('输入框和表单')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
                autofocus: true,
                controller: _usernameController, // 设置controller
                focusNode: focusNode1, // 关联focusNode1
                decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey)), // 未获得焦点下划线颜色
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange)) // 获得焦点下划线颜色
                    )),
            TextField(
                obscureText: true,
                onChanged: (v) => {print('password is: $v')},
                focusNode: focusNode2, // 关联focusNode2
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock))),
            Builder(
                builder: (ctx) => (Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            // 将焦点从第一个移动到第二个
                            // 第一种写法
                            // FocusScope.of(context).requestFocus(focusNode2);
                            // 下面是第二种写法
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusNode2);
                          },
                          child: Text('移动焦点到密码框'),
                        ),
                        FlatButton(
                            onPressed: () {
                              focusNode1.unfocus();
                              focusNode2.unfocus();
                            },
                            child: Text('隐藏键盘'))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
