import 'package:flutter/material.dart';

// 可视化调试所需包
import 'package:flutter/rendering.dart';

// 《State x Widget》文章
import 'package:myapp/stateWidgetDemo.dart';

// 组件参数、传参测试
// import 'package:myapp/testParams.dart';

// 登录页面
// import 'package:myapp/loginPage.dart';

void main() {
  // 启用布局结构 “可视化调试”
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

// 继承自 StatelessWidget
class MyApp extends StatelessWidget {
  // 重写 Widget 类实现
  @override
  // Widget 实现构建 build 函数
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        // 使用 Scaffold 实现 home 函数
        // 导航栏（顶部）显示文字
        appBar: AppBar(
          // 导航栏（顶部）
          title: Text('Welcome to Flutter'), // 文字内容
        ),

        // Scaffold 的容器 body
        // 将 Text('Hello World') 换成 UnchangeWidget 组件
        body: UnchangeWidget(), 
      ),
    );
  }
}
