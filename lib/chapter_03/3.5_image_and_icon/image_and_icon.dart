import 'package:flutter/material.dart';

/*
 * ImageProvider
 *
 * ImageProvider 是一个抽象类，定义了图片数据获取的接口load()，从不同的数据源获取图片需要实现
 * 不同的ImageProvider，
 * - AssetImage是实现了从Asset中加载图片的ImageProvider
 * - NetworkImage是实现了从网络加载图片的ImageProvider
 *
 * Image
 * Image widget必填参数image，它对应了一个ImageProvider
 *
 * 从assets中添加图片
 * 1. 项目根目录创建images文件夹，其中添加图片资源
 * 2. 在pubspec.yaml中的flutter部分中添加assets内容
 * 3. AssetImage(url)加载图片
 *
 * Flutter中，iconfont想必图片具有的优势：
 * 1. 体积小，可以减小安装包的大小
 * 2. 矢量，iconfont是矢量图标，放大不会影响图标的清晰度
 * 3. 可应用文本样式，可以改变字体的颜色，大小，对齐等
 * 4. 可以通过TextSpan和文本混用
 *
 * 使用 Material Design字体图标
 * 在pubspec.yaml文件中配置 uses-material-design: true
 *
 * Material Design的图标
 * https://material.io/tools/icons/
 *
 * 使用自定义图标
 *
 */

class ImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片和icon'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Text("图片示例", style: TextStyle(fontSize: 20)),
            _renderImageList(),
            Text("字体图标示例", style: TextStyle(fontSize: 20)),
            _renderIconList(),
          ],
        )));
  }

  Widget _renderImageList() {
    var img = AssetImage('assets/images/chapter_03/face-recognition-example.png');
    return Column(
        children: <Image>[
      Image(image: img, height: 50, width: 100, fit: BoxFit.fill),
      Image(image: img, height: 50, width: 100, fit: BoxFit.contain),
      Image(image: img, height: 50, width: 100, fit: BoxFit.cover),
      Image(image: img, height: 50, width: 100, fit: BoxFit.fitHeight),
      Image(image: img, height: 50, width: 100, fit: BoxFit.fitWidth)
    ].map((e) {
      return Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(width: 100, child: e)),
          Text(e.fit.toString())
        ],
      );
    }).toList());
  }

  Widget _renderIconList() {
    String icons = '';
    icons += '\uE914';
    icons += '\uE000';
    icons += '\uE90D';

    return Column(children: <Widget>[
      Text(
        icons,
        style: TextStyle(
            fontFamily: 'MaterialIcons', fontSize: 16, color: Colors.green),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.call,
            color: Colors.green,
            size: 16,
          ),
          Icon(
            Icons.android,
            color: Colors.green,
            size: 16,
          ),
          Icon(
            Icons.iso,
            color: Colors.green,
            size: 16,
          )
        ],
      )
    ]);
  }
}
