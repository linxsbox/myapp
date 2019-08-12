import 'package:flutter/material.dart';

var tempText = '';

// 定义一个有状态的 inputTextBox 类，继承至 StatefulWidget
class InputTextBox extends StatefulWidget {
  String textdata;
  String inputText;

  InputTextBox(this.textdata, {Key key, this.inputText}) : super(key: key);
  // this class : supper = StatefulWidget => StatefulWidget({ Key key }) : super(key: key)
  // StatefulWidget: super = Widget => Widget(Key key)
  // 所以 key 最终是由 Widget 传进来的
  // this.arguments = this class statement attribute

  // this.inputText = InputTextBox.inputText

  // InputTextBox(this.text);

  @override // 重写状态控制的创建抽象类
  State<StatefulWidget> createState() {
    // 由此看出 this = InputTextBox
    print('this 是个啥？ => ${this}');
    print('this.inputText 是个啥？ => ${this.inputText}');
    return new _InputTextBox();
  }

  // // 重写状态控制的创建抽象类
  // @override
  // // 创建状态控制类的简写方式，这里的 new 也可以省略
  // createState() => _InputTextBox();
}

// 实现状态管理类，继承自 State 状态管理类，需要管理的组件类型
class _InputTextBox extends State<InputTextBox> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // widget = State<InputTextBox> => InputTextBox get State.widget()
    print('widget 是个啥？ => ${widget}');
    print('widget.inputText => ${widget.inputText}');
    // 这里可以看出，创建状态管理组件时，组件的类型就是实现类的类型。
    // 因此组件最终实现的是一个 Widget 对象，Widget 的类型就是组件的类型。
    // 而组件类 get widget = Widget widget 既 widget = 组件类。
    // 所以 widget.xxx 即为 InputTextBox.xxx

    print('----- 例子 -----');
    var tt = new InputTextBox('哈哈哈', inputText: '123'); // 有状态的组件 InputTextBox
    print('tt 是个啥？ => ${tt}'); // 输出 InputTextBox
    print(tt.textdata); // 输出 哈哈哈
    print(tt.inputText); // 输出 123

    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: '请输入内容', // 显示提示内容
            // labelText: '请输入内容', // 显示提示内容，输入焦点时显示 label
            helperText: '请输入任意内容', // 输入框下方提示内容
            // errorText: '内容不能为空', // 输入框下方错误提示内容
            // icon: Icon(Icons.)
            // suffixIcon: Icon(Icons.)
          ),
          controller: _textEditingController,
          onChanged: (val) {
            this.setState(() {
              tempText = _textEditingController.text;
              print(tempText);
            });
          },
        ),
        Text(tempText),
      ],
    );
  }
}
