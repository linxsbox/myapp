import 'package:flutter/material.dart';

// 继承 StatelessWidget 意味着无法通过数据变更而改变内容
class UnchangeWidget extends StatelessWidget {
  String setText = '我是原来的文字'; // 声明变量文字 - 默认值

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(setText), // 使用变量 setText 来设置 Text 的内容
          RaisedButton(
            child: Text('改变内容'),
            onPressed: () {
              // 按钮点击事件 - 改变内容
              print('触发了按钮');
              setText = '我是新的文字'; // 赋值新文字内容
            },
          )
        ],
      ),
    );
  }
}

// // 继承 StatefulWidget 意味着可以通过数据变更而改变内容
// class UnchangeWidget extends StatefulWidget {
//   String setText = '原来的内容'; // 变量设置文字 - 默认值

//   @override // 创建状态控制类的简写方式，这里的 new 也可以省略
//   _UnchangeWidgetState createState() => _UnchangeWidgetState();
// }

// class _UnchangeWidgetState extends State<UnchangeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: <Widget>[
//         Text(widget.setText), // 使用变量 setText 来设置 Text 的内容
//         RaisedButton(
//           child: Text('改变内容'),
//           onPressed: () {
//             // 按钮点击事件 - 改变内容
//             print('触发了按钮');
//             setState(() {
//               // 调用状态变更函数
//               widget.setText = '我是新的文字'; // 赋值新文字内容
//               print('状态变更文字更新');
//             });
//           },
//         ),
//       ]),
//     );
//   }
// }
