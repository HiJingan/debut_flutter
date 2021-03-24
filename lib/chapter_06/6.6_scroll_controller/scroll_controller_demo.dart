import 'package:flutter/material.dart';

class ScrollControllerDemo extends StatefulWidget {
  @override
  _ScrollConttrollerDemoState createState() {
    return new _ScrollConttrollerDemoState();
  }
}

class _ScrollConttrollerDemoState extends State<ScrollControllerDemo> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  void switchBtnVisible() {
    setState(() {
      showToTopBtn = !showToTopBtn;
    });
  }

  @override
  void initState() {
    super.initState();
    // 监听滚动事件
    _controller.addListener(() {
      // print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        switchBtnVisible();
      } else if (_controller.offset > 1000 && showToTopBtn == false) {
        switchBtnVisible();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 为避免内存泄露
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index'));
              })),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
