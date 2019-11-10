import 'package:flutter/material.dart';

// 可视化调试所需包
import 'package:flutter/rendering.dart';

// State x Widget
// import 'package:myapp/stateWidgetDemo.dart';

// 多子类元素布局（一）：Row & Column
// import 'package:myapp/layoutDemo1.dart';

// 多子类元素布局（二）：ListBody & ListView
// import 'package:myapp/layoutDemo2.dart';

// 多子类元素布局（三）：Table & Waro & Flow 
import 'package:myapp/layoutDemo3.dart';

// 组件参数、传参测试
// import 'package:myapp/testParams.dart';

// 登录页面
// import 'package:myapp/loginPage.dart';

void main() {
  // 启用布局结构 “可视化调试”
  debugPaintSizeEnabled = !true;
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
        body: Container(
          // 布局（一）
          // child: Text('Hello World'), // hello world 例子
          // child: RowStructDemo(), // Row 结构的例子
          // child: ColumnStructDemo(), // Column 结构的例子

          // 布局（二）
          // ListBody - 编译错误的情况
          // child: ListBodyDeme(), 
          
          // child: ListViewDeme(), // ListView 例子
          // child: ListViewBuilderDeme(), // ListView Builder例子
          // child: ListViewSeparatedDeme(), // ListView Separated例子
          // child: ListViewCustomDeme(), // ListView Custom例子
          
          // 布局（三）
          // child: TableDemo(), // TableDemo 例子
          // child: WarpDemo(), // WarpDemo 例子
          child: FlowDemo(), // FlowDemo 例子
          
          // 登录页面的例子
          // child: BuildLoginFormBox(),
        ),
        // ----- 单子元素 end -----

        // ListView Widget
        // body: ListView(
        //   children: <Widget>[
        //     // 布局（一）
        //     // Flutter 中文网例子 - 详情页面
        //     // PageDemo(),
            
        //     // 布局（二）
        //     // ListBody 显示正确
        //     ListBodyDeme(),
        //   ],
        // ),
        // ----- 多子元素 end -----
      ),
    );
  }
}
