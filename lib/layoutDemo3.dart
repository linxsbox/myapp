import 'package:flutter/material.dart';

// 引入英文单词的包
// import 'package:english_words/english_words.dart';

// Table 实现例子
class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Table Widget
      child: Table(
        // 表格边框
        border: TableBorder.all(
          width: 1.0, // 边框线宽度
          style: BorderStyle.solid, // 边框线风格
          color: Colors.red, // 边框线颜色
        ),

        // 默认的 表格列宽度分配方式
        // defaultColumnWidth: FlexColumnWidth(1.0), // 默认是弹性列宽
        // defaultColumnWidth: IntrinsicColumnWidth(flex: 1.0), // 固有列宽
        // defaultColumnWidth: FractionColumnWidth(100.0), // 小部分列宽？
        // defaultColumnWidth: FixedColumnWidth(100.0), // 固定列宽
        // defaultColumnWidth: MaxColumnWidth(FixedColumnWidth(100.0),FixedColumnWidth(200.0)), // 最大列宽
        // defaultColumnWidth: MinColumnWidth(FixedColumnWidth(100.0),FixedColumnWidth(200.0)), // 最小列宽

        // 表格列宽
        /// [int] 代表第几列，[TableColumnWidth] 代表列宽的类型
        /// [FixedColumnWidth] 就是固定列宽
        columnWidths: const <int, TableColumnWidth>{
          // 0: FlexColumnWidth(1.0),
          // 1: FlexColumnWidth(2.0),
          // 2: FlexColumnWidth(3.0),

          // 0: IntrinsicColumnWidth(flex: 1.0),
          // 1: IntrinsicColumnWidth(flex: 2.0),
          // 2: IntrinsicColumnWidth(flex: 3.0),

          // 0: FractionColumnWidth(100.0),
          // 1: FractionColumnWidth(100.0),
          // 2: FractionColumnWidth(100.0),

          // 0: FixedColumnWidth(100.0),
          // 1: FixedColumnWidth(200.0),
          // 2: FixedColumnWidth(75.0),

          // 0: MaxColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(120.0)),
          // 1: MaxColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(100.0)),
          // 2: MaxColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(100.0)),

          // 0: MinColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(120.0)),
          // 1: MinColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(100.0)),
          // 2: MinColumnWidth(FixedColumnWidth(100.0), FixedColumnWidth(100.0)),
        },

        // 默认的 cell 垂直排列方向
        /// [top] 顶部对齐
        /// [middle] 垂直居中对齐
        /// [bottom] 底部对齐
        /// [baseline] 基线对齐
        /// [fill] 充满 cell
        defaultVerticalAlignment: TableCellVerticalAlignment.top,

        // Table Row Widget
        // children: fixedCell(), // 固定 Widget 代码实现的 2x3 表格
        children: dynamicCell(4, 5), // 动态编码实现的 row x cell 表格
      ),
    );
  }
}

// 固定的单元格 2 x 3
List<TableRow> fixedCell() {
  return <TableRow>[
    TableRow(
      // Table Cell Widget
      children: <TableCell>[
        TableCell(
          child: new Text('cell 1-1'),
        ),
        TableCell(
          child: new Text('cell 1-2'),
        ),
        TableCell(
          child: new Text('cell 1-3'),
        ),
      ],
    ),
    TableRow(
      children: <TableCell>[
        TableCell(
          child: new Text('cell 2-1'),
        ),
        TableCell(
          child: new Text('cell 2-2'),
        ),
        TableCell(
          child: new Text('cell 2-3'),
        ),
      ],
    ),
  ];
}

// 动态单元格 rowCount x cellConut
List<TableRow> dynamicCell(int rowCount, int cellConut) {
  var cellList = new List<TableRow>();
  for (var i = 0; i < rowCount; i++) {
    // 记得先给 TableRow.children 初始化类型
    cellList.add(TableRow(children: <TableCell>[]));
    // 不然会报错：add was called on null. add(Instace of 'TableCell')
    print(cellList[i]);
    for (var j = 0; j < cellConut; j++) {
      cellList[i].children.add(
            TableCell(
              child: new Text('cell $i-$j'),
            ),
          );
    }
  }

  return cellList;
}

// Warp 实现例子
class WarpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 400.0,
      child: Wrap(
        // 轴的方向，horizontal 和 vertical，默认 horizontal
        // direction: Axis.horizontal,

        // 主轴方向的行内子元素对齐方式，默认 start，但你可以试试 spaceBetween
        // alignment: WrapAlignment.start,

        // 副轴方向的行对齐方式，默认 start，但你可以试试 spaceBetween
        // runAlignment: WrapAlignment.start,

        //  副轴方向上的行内子元素对齐方式，默认 start
        // crossAxisAlignment: WrapCrossAlignment.start,

        // verticalDirection: VerticalDirection.down, //  垂直方向，默认为down
        // spacing: 10.0, // 与下一个 widget 的空间大小，默认为 0
        // runSpacing: 40.0, // widget 行之间的空间大小，默认为 0
        children: textBox(10),
      ),
    );
  }
}

// text 动态列表
List<Widget> textBox(int count) {
  var tempList = <Widget>[];
  for (var i = 0; i < count; i++) {
    if (i == 4) {
      tempList.add(Container(
        height: 60.0, // 解除注释发现惊喜
        padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            style: BorderStyle.solid,
            color: Colors.red,
          ),
        ),
        child: Text(i > 5 ? 'warp -----$i-----' : 'warp $i'),
      ));
      continue;
    }
    tempList.add(Container(
      padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          style: BorderStyle.solid,
          color: Colors.red,
        ),
      ),
      child: Text(i > 5 ? 'warp -----$i-----' : 'warp $i'),
    ));
  }

  return tempList;
}

// Flow 实现例子
class FlowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flow(
        // Flow 委托，必须实现
        delegate: BuildFlowChild(),
        // 子元素列表
        children: textBox(10),
      ),
    );
  }
}

// 实现 FlowDelegate
class BuildFlowChild extends FlowDelegate {
  // 重写 shouldRepaint 实现
  // 方法名太长怎么办？借助于 vscode 以及 dart 插件的优势，只需要输入 sr 就能生成相关的代码块模板了
  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // 在没有实现完全之前，想要看到一些信息可以先让它返回 true
    // return true;
    
    // 旧的代理如果不等于当前代理，则发生绘制
    return oldDelegate != this;
  }

  // 重写 paintChildren 实现
  // 这里也是一样记不住没关系，输入 pc 即可
  @override
  void paintChildren(FlowPaintingContext context) {
    // 通过 FlowPaintingContext context 可以得到子元素列表对象
    // 再通过 for 将子元素来进行处理，context 可以得到子元素的对象以及相关的方法
    // context.childCount 为子元素的数量

    double ptx = 0.0; // 偏移 x 累计
    double pty = 0.0; // 偏移 y 累计

    for (var i = 0; i < context.childCount; i++) {
      // context.getChildSize(i); // 得到子元素 i 的大小
      // print(item); // 输出每个子元素的大小
      // context.paintChild(i); // 我就是不想实现绘制怎么办？那么它们就会挤在一起
      // 输入 mtv 来得到代码块模板 Matrix4.translationValues
      // 参数为 x y z 轴的位置 (double x, double y, double z)
      // transform: Matrix4.translationValues(dx * i, 0, 0)); // 这样不会换行，因为没有绘制 y 轴的位置
      // 如果需要换行那么就要将每一个子元素的摆放位置计算出来

      // 获取当前子元素的宽度
      var dx = context.getChildSize(i).width;

      if (ptx + dx > context.size.width) {
        // 处理换行
        ptx = 0.0;
        pty += context.getChildSize(i).height;
      }

      context.paintChild(
        i,
        transform: Matrix4.translationValues(ptx, pty, 0),
      );

      ptx += dx;
    }
  }
}
