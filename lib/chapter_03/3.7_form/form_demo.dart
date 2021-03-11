import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => new _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _userpwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Form(
              key: _formKey, // 设置globalKey，用于后面获取FormState
              autovalidateMode: AutovalidateMode.always, // 校验模式设置
              child: Column(children: <Widget>[
                TextFormField(
                    autofocus: true,
                    controller: _usernameController,
                    validator: _validateUsername,
                    decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '用户名或邮箱',
                        icon: Icon(Icons.person))),
                TextFormField(
                  controller: _userpwdController,
                  obscureText: true,
                  validator: _validateUserPwd,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                ),
                // 登录按钮
                Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                        // TODO: RaisedButton 替换为 ElevatedButton后，该如何实现原样式
                        // padding: EdgeInsets.all(16),
                        child: Text(
                          '提交',
                          style: TextStyle(fontSize: 16),
                        ),
                        // color: Theme.of(context).primaryColor,
                        // textColor: Colors.white,
                        onPressed: () {
                          // 通过_formKey.currentState获取FormState后
                          // 调用validate()方法校验用户名密码是否合法，
                          // 校验通过后再提交数据
                          if ((_formKey.currentState as FormState).validate()) {
                            // 验证通过后提交数据
                            final userName = _usernameController.text;
                            final password = _userpwdController.text;
                            print('userName: $userName \n password: $password');
                          }
                        },
                      ))
                    ]))
              ])),
        ));
  }

  String _validateUsername(String v) {
    return v.trim().length > 0 ? null : '用户名不能为空';
  }

  String _validateUserPwd(String v) {
    return v.trim().length > 7 ? null : '密码不能少于8位';
  }
}
