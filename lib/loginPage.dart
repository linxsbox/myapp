import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

// 登录页面主结构
class BuildLoginFormBox extends StatefulWidget {
  @override
  _BuildLoginFormBoxState createState() => _BuildLoginFormBoxState();
}

class _BuildLoginFormBoxState extends State<BuildLoginFormBox> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LoginFormBox(),
                buildOtherLogin(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 登录表单部分
class LoginFormBox extends StatefulWidget {
  @override
  _LoginFormBoxState createState() => _LoginFormBoxState();
}

class _LoginFormBoxState extends State<LoginFormBox> {
  FocusScopeNode _focusScopeNode; // 当前焦点节点

  FocusNode _userInputNode = FocusNode(); // 用户框节点
  FocusNode _pwdInputNode = FocusNode(); // 密码框节点

  // 输入控制器
  TextEditingController _textUserController = TextEditingController();
  TextEditingController _textPwdController = TextEditingController();

  String _tempUser = '';
  String _tempPwd = '';

  Color _eyeIconColor = Colors.grey;
  bool _isObscureText = true;

  // 空格处理方法
  String textTrimSpace(String text) {
    return text.trim().replaceAll(' ', '');
  }

  // 检查输入
  bool checkInput() {
    if (_focusScopeNode == null) {
      _focusScopeNode = FocusScope.of(context);
    }

    if (!textTrimSpace(_tempUser).isNotEmpty) {
      _focusScopeNode.requestFocus(_userInputNode);
      return false;
    }

    if (!textTrimSpace(_tempPwd).isNotEmpty) {
      _focusScopeNode.requestFocus(_pwdInputNode);
      return false;
    }

    return true;
  }

  @override
  void initState() {
    _userInputNode.addListener(() {
      // print('_userInputNode: ${_userInputNode.hasFocus}');
      if (!_userInputNode.hasFocus) {
        setState(() {
          _textUserController.text = textTrimSpace(_tempUser);
        });
      }
    });
    _textPwdController.addListener(() {
      // print('_pwdInputNode: ${_pwdInputNode.hasFocus}');
      if (!_pwdInputNode.hasFocus) {
        setState(() {
          _textPwdController.text = textTrimSpace(_tempPwd);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _themColor = Theme.of(context).iconTheme.color;

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 30.0, 0, 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 40.0),
              Text('Logo', style: TextStyle(fontSize: 40.0))
            ],
          ),
        ),
        TextField(
          // 用户名输入框
          // textInputAction: TextInputAction.done,
          focusNode: _userInputNode,
          controller: _textUserController,
          decoration: InputDecoration(
            hintText: '请输入 手机号/邮箱', // 显示提示内容
            prefixIcon: Icon(Icons.person),
          ),
          onChanged: (text) {
            _tempUser = text;
          },
          onSubmitted: (text) {
            if (!textTrimSpace(text).isNotEmpty) {
              return;
            }
            setState(() {
              _tempUser = textTrimSpace(text);
              _textUserController.text = textTrimSpace(text);
            });

            if (_focusScopeNode == null) {
              _focusScopeNode = FocusScope.of(context);
            }
            _focusScopeNode.requestFocus(_pwdInputNode);
          },
        ),
        TextField(
          // 密码输入框
          textInputAction: TextInputAction.done,
          focusNode: _pwdInputNode,
          controller: _textPwdController,
          obscureText: _isObscureText, // 是否密文显示
          decoration: InputDecoration(
            hintText: '请输入 密码', // 显示提示内容
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscureText ? Icons.visibility : Icons.visibility_off,
                color: _eyeIconColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscureText = !_isObscureText; // 切换文本输入框 密文/明文 显示状态
                  // 切换图标显示为对应状态的颜色
                  _eyeIconColor = _isObscureText ? Colors.grey : _themColor;
                });
                print('点击？ $_isObscureText');
              },
            ),
          ),
          onChanged: (text) {
            _tempPwd = text;
          },
          onSubmitted: (text) {
            if (!textTrimSpace(text).isNotEmpty) {
              return;
            }
            setState(() {
              _tempPwd = textTrimSpace(text);
              _textPwdController.text = textTrimSpace(text);
            });

            _pwdInputNode.unfocus();

            if (checkInput()) {
              // 调用登录方法
              print('调用登录方法: 假装一下');

              // print('${_textUserController.text}, ${_textPwdController.text}');
              print('$_tempUser, $_tempPwd');
            }
          },
        ),
        Row(
          children: <Widget>[],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('登  录', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                onPressed: () {
                  // print('${_textUserController.text}, ${_textPwdController.text}');
                  print('$_tempUser, $_tempPwd');

                  if (checkInput()) {
                    print('点击按钮调用登录方法: 假装一下');
                  }

                  _userInputNode.unfocus();
                  _pwdInputNode.unfocus();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 第三方登录 Icon 列表
final List _otherLoginIconBtn = [
  {'title': 'QQ', 'icon': GroovinMaterialIcons.qqchat},
  {'title': '微信', 'icon': GroovinMaterialIcons.wechat},
];

// 第三方登录 组件
Column buildOtherLogin(BuildContext context) {
  Color _themColor = Theme.of(context).iconTheme.color;
  return Column(
    children: <Widget>[
      // 第三方登录 文字样式
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Divider(height: 1.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 10.0,
            ),
            child: Text(
              '其他账号登录',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Divider(height: 1.0),
            ),
          ),
        ],
      ),
      // 第三方登录 Icon 按钮组
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: _otherLoginIconBtn
            .map(
              (item) => Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(item['icon'], color: _themColor),
                    onPressed: () {},
                  );
                },
              ),
            )
            .toList(),
      ),
    ],
  );
}
