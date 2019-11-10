import 'package:flutter/material.dart';

// 引入英文单词的包
import 'package:english_words/english_words.dart';

// ListBody 实现例子
class ListBodyDeme extends StatelessWidget {
  // 生成随机单词
  final wp = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: <Widget>[
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
      ],
    );
  }
}

// ListView 实现例子
class ListViewDeme extends StatelessWidget {
  // 生成随机单词
  final wp = WordPair.random();
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      // primary: true, // 与 controller 互斥
      controller: _controller, // controller 事件
      // physics: physics
      // reverse: true,
      children: <Widget>[
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
        Text(wp.asPascalCase),
      ],
    );
  }
}

// ListViewBuilder 实现例子
class ListViewBuilderDeme extends StatefulWidget {
  @override
  _ListViewBuilderDemeState createState() => _ListViewBuilderDemeState();
}

class _ListViewBuilderDemeState extends State<ListViewBuilderDeme> {
  // 用于保存生成的单词
  final _wordPairList = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.0), // 列表四周边距为 20
      itemCount: 100, // 生成子元素上限是 100个
      // itemBuilder 接受一个回调函数 参数为：BuildContext context, int index
      itemBuilder: (context, index) {
        if (index >= _wordPairList.length) {
          // 生成单词对，将其全部添加至 单词列表中, 每次生成10对
          _wordPairList.addAll(generateWordPairs().take(10));
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0), // 子元素上下外边距为 10
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0), // 子元素内边距
          decoration: BoxDecoration(color: Colors.grey),
          child: Text(
            // 生成随机单词
            index.toString() + ' ' + _wordPairList[index].asPascalCase,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
    );
  }
}

// ListViewSeparatedDeme 实现例子
class ListViewSeparatedDeme extends StatefulWidget {
  @override
  _ListViewSeparatedDemeState createState() => _ListViewSeparatedDemeState();
}

class _ListViewSeparatedDemeState extends State<ListViewSeparatedDeme> {
  // 用于保存生成的单词
  final _wordPairList = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20.0), // 列表四周边距为 20
      itemCount: 100, // 生成子元素上限是 100个
      // itemBuilder 接受一个回调函数 参数为：BuildContext context, int index
      itemBuilder: (context, index) {
        if (index >= _wordPairList.length) {
          // 生成单词对，将其全部添加至 单词列表中, 每次生成10对
          _wordPairList.addAll(generateWordPairs().take(10));
        }

        return Text(
          // 生成随机单词
          index.toString() + ' ' + _wordPairList[index].asPascalCase,
          style: TextStyle(fontSize: 20.0),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 2.0,
          decoration: BoxDecoration(color: Colors.grey),
        );
      },
    );
  }
}

// ListViewCustomDeme 实现例子
class ListViewCustomDeme extends StatefulWidget {
  @override
  _ListViewCustomDemeState createState() => _ListViewCustomDemeState();
}

class _ListViewCustomDemeState extends State<ListViewCustomDeme> {
  // 生成随机单词
  final wp = WordPair.random();

  // 用于保存生成的单词
  final _wordPairList = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      padding: EdgeInsets.all(20.0), // 四周边距为 20

      // // 使用直接列表方式实现
      // childrenDelegate: SliverChildListDelegate(<Widget>[
      //   Text(wp.asPascalCase),
      //   Text(wp.asPascalCase),
      //   Text(wp.asPascalCase),
      //   Text(wp.asPascalCase),
      //   Text(wp.asPascalCase),
      // ]),

      // 使用编码方式实现
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index >= _wordPairList.length) {
            // 生成单词对，将其全部添加至 单词列表中, 每次生成10对
            _wordPairList.addAll(generateWordPairs().take(10));
          }

          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0), // 子元素上下外边距为 10
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0), // 子元素内边距
            decoration: BoxDecoration(color: Colors.grey),
            child: Text(
              // 生成随机单词
              index.toString() + ' ' + _wordPairList[index].asPascalCase,
              style: TextStyle(fontSize: 20.0),
            ),
          );
        },
        childCount: 50, // 子元素生成上限
      ),
    );
  }
}
