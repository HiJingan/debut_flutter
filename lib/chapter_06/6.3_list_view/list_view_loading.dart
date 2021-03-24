import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewLoading extends StatefulWidget {
  @override
  _ListViewLoadingState createState() {
    return new _ListViewLoadingState();
  }
}

class _ListViewLoadingState extends State<ListViewLoading> {
  static const loadingTag = '##loading##'; // 结尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
            itemBuilder: _renderList,
            separatorBuilder: _renderSeparator,
            itemCount: _words.length));
  }

  Widget _renderSeparator(BuildContext context, int index) {
    return Divider(
      height: .0,
    );
  }

  Widget _renderList(BuildContext context, int index) {
    // 如果到了表尾
    if (_words[index] == loadingTag) {
      // 如果不足100条，继续获取数据
      if (_words.length - 1 < 100) {
        // 获取数据
        _retrieveData();
        // loading
        return Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )));
      } else {
        // 已经加载了100条数据，不再获取数据
        return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Text(
              '我是有底线的',
              style: TextStyle(color: Colors.grey),
            ));
      }
    }
    // 返回列表项
    return ListTile(title: Text(_words[index]));
  }

  /*
   * 获取列表数据
   */
  void _retrieveData() {
    Future.delayed(Duration(seconds: 3)).then((e) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
