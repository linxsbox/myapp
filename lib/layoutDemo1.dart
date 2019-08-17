import 'package:flutter/material.dart';

// Row 结构的例子
class RowStructDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // Row 主轴的对齐方式，Row 的主轴为 x 轴
      /// [start] 默认值，即主轴上左对齐
      /// [end] 即主轴上右对齐
      /// [center] 主轴上的水平居中对齐
      /// [spaceBetween] 左右两极对齐，剩余元素以相同间隔平均分配剩余空间
      /// [spaceAround] 每个元素以相同的左右间隔平均分配剩余空间
      /// [spaceEvenly] 所有元素以相同的间隔平均分配剩余空间

      // mainAxisAlignment 的默认值为 start
      mainAxisAlignment: MainAxisAlignment.start, // 默认值

      // Row 副轴的对齐方式
      // Row 副轴为 y 轴
      /// [start] 即副轴的顶部对齐
      /// [end] 即副轴的底部对齐
      /// [center] 默认值，垂直居中对齐
      /// [stretch] 将子元素拉伸至副轴高度相同
      /// [baseline] 需要与 TextBaseline 配合使用

      // crossAxisAlignment 的默认值为 center
      crossAxisAlignment: CrossAxisAlignment.center,

      // 主轴尺寸，Row 则是 x 轴尺寸，即 width 的大小
      // 值为 min 和 max，默认为 max
      // mainAxisSize: MainAxisSize.max,

      // 绘制方向：up、down，默认 down
      // verticalDirection: VerticalDirection.down,

      // 文字基线
      // textBaseline: TextBaseline.alphabetic,

      // 子元素列表
      children: <Widget>[
        // 为了更直观的看到视图布局的结果
        Container(color: Colors.black, width: 40.0, height: 300.0,),
        // Text( // 文字基线测试
        //   'Logly',
        //   style: TextStyle(fontSize: 50.0),
        // ),
        // Text( // 文字基线测试
        //   '中文',
        //   style: TextStyle(fontSize: 30.0),
        // ),
        ChildrenElement('元素1', Colors.red),
        ChildrenElement('元素2', Colors.green),
        ChildrenElement('元素3', Colors.blue),
        // 为了更直观的看到视图布局的结果
        Container(color: Colors.black, width: 40.0, height: 300.0,),
      ],
    );
  }
}

// Column 结构的例子
class ColumnStructDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Column 主轴的对齐方式，Column 的主轴为 y 轴
      // mainAxisAlignment 的默认值为 start
      /// [start] 默认值，即主轴上上对齐
      /// [end] 即主轴上下对齐
      /// [center] 主轴上的垂直居中对齐
      /// [spaceBetween] 上下两极对齐，剩余元素以相同间隔平均分配剩余空间
      /// [spaceAround] 每个元素以相同的左右间隔平均分配剩余空间
      /// [spaceEvenly] 所有元素以相同的间隔平均分配剩余空间

      // mainAxisAlignment 的默认值为 start
      mainAxisAlignment: MainAxisAlignment.start, // 默认值

      // Column 副轴的对齐方式
      // Column 副轴为 x 轴
      // crossAxisAlignment 的默认值为 center
      /// [start] 从左到右
      /// [end] 从右到左
      /// [center] 默认值，水平居中对齐
      /// [stretch] 拉伸至副轴宽度
      /// [baseline] 需要与 TextBaseline 配合使用

      // crossAxisAlignment 的默认值为 center
      crossAxisAlignment: CrossAxisAlignment.center,

      // 主轴尺寸，Column 则是 y 轴尺寸，即 height 的大小
      // 值为 min 和 max，默认为 max
      // mainAxisSize: MainAxisSize.max,

      // 绘制方向：up、down，默认 down
      // verticalDirection: VerticalDirection.down,

      // 文字基线
      // textBaseline: TextBaseline.ideographic,

      // 子元素列表
      children: <Widget>[
        // 为了更直观的看到视图布局的结果
        Container(color: Colors.black, height: 40.0),
        ChildrenElement('第 1 个子元素', Colors.red),
        ChildrenElement('第 2 个子元素', Colors.green),
        ChildrenElement('第 3 个子元素', Colors.blue),
        // 为了更直观的看到视图布局的结果
        Container(color: Colors.black, height: 40.0),
      ],
    );
  }
}

// 子元素组件 - 带边框的文字组件
// 主要是为了更直观的看到改变轴的对齐方式后的结果
class ChildrenElement extends StatelessWidget {
  String text; // 文字内容
  Color color; // 边框颜色

  // 组件接收 2 个参数
  ChildrenElement(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    // Container 类似 html 里的 div
    return Container(
      color: color,
      // 装饰类型 - 盒子类型
      // decoration: BoxDecoration(
      //   // 盒子的装饰 - 类似 css 里的 border
      //   border: Border.all(width: 4.0, color: Colors.black),
      // ),
      // Text 文字组件 类似 html 里的 span
      child: Text(text),
    );
  }
}

// Flutter 中文网例子
// 按照例子，这里我们将拆分成4个小组件，最后再组装起来
class PageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 按照理解，我们这里使用 Column 来进行列的分配
    return Column(
      children: <Widget>[
        // 第一行 - 图片部分的实现
        Image.asset(
          'images/lake.jpg',
          width: 600.0,
          height: 240.0,
          // BoxFit.cover 告诉框架，图像应该尽可能小，但任然覆盖整个渲染的区域
          fit: BoxFit.cover,
        ),
        // 第二行 - 标题行部分的实现
        TitleSection(),
        // 第三行 - 按钮组部分的实现
        BtnGroupRow(),
        // 第四行 - 文本块部分的实现
        TextBlock(),
      ],
    );
  }
}

// 标题行部分的实现
class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 类似 div，因为有边距要求所以这里使用 Container 开增加边距
    return Container(
      padding: const EdgeInsets.all(32.0),
      // Row 行
      child: Row(
        children: [
          // Expanded 用于撑开第一个子元素
          Expanded(
            // 文本为上下两行，所以使用 Column 来实现标题部分
            // 上下两行，第一行为主标题，第二行为副标题
            child: Column(
              // 副轴 x 轴防线左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 类似 div
                Container(
                  // padding bottom: 8
                  padding: const EdgeInsets.only(bottom: 8.0),
                  // 主标题
                  child: Text(
                    'Oeschinen Lake Campground',
                    // 文字加粗
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // 副标题文字 颜色比主标题淡
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]), // icon 图标
          Text('41'), // 图标后文字
        ],
      ),
    );
  }
}

// 按钮组部分的实现
class BtnGroupRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 由于按钮是重复的，所以这里使用一个方法来创建按钮
    // 接收两个参数，一个是按钮的 icon 类型和要显示的文字
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      // 这里返回一个 Column，主要是单按钮由 icon 图标和文字上下两个部分组成
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标部分
          Icon(icon, color: color),
          // 文字部分
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(Icons.call, 'CALL'),
        buildButtonColumn(Icons.near_me, 'ROUTE'),
        buildButtonColumn(Icons.share, 'SHARE'),
      ],
    );
  }
}

// 文本块部分的实现
class TextBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 因为文字太长，所以这里我使用了字符串拼接的方式
    // 而例子中使用的是字符串模板方式：前后三个单引号 '''文字'''
    String text = 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.' +
        ' Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.' +
        ' A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest,' +
        ' leads you to the lake, which warms to 20 degrees Celsius in the summer.' +
        ' Activities enjoyed here include rowing, and riding the summer toboggan run.';
    // 将文本放入容器中
    return Container(
      // padding: 32
      padding: const EdgeInsets.all(32.0),
      // softWrap 属性表示文本是否应在软换行符（例如句点或逗号）之间断开
      child: new Text(text, softWrap: true),
    );
  }
}
