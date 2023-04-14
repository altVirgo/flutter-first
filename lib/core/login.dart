import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first/utils/shared_preferences_util.dart';
import 'package:flutter_first/utils/toast.dart';
import 'package:flutter_first/widget/common_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  // 点击空白  关闭键盘 时传的一个对象
  FocusNode blankNode = FocusNode();
  String _account = 'admin';
  String _password = 'admin123';
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  Color _accountBorderColor = Colors.white;
  Color _passwordBorderColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Wrap(children: <Widget>[
          const Text(
            '手机号登录',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30),
          ),
          Form(
            child: Column(
              children: <Widget>[
                buildAccountTextField(),
                buildPasswordTextField(),
                buildLoginButton()
              ],
            ),
          ),
        ])));
  }

  ///账号
  Container buildAccountTextField() {
    return Container(
      padding: EdgeInsets.only(top: 55.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("账号",
              style:
                  TextStyle(fontSize: 32.sp, color: const Color(0xff737A83))),
          Container(
            height: 90.w,
            padding: EdgeInsets.only(left: 40.w),
            margin: EdgeInsets.only(top: 24.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: const Color(0xffEEEFF2),
                border: Border.all(color: _accountBorderColor, width: 1.w)),
            child: TextFormField(
                initialValue: _account,
                style:
                    TextStyle(fontSize: 32.sp, color: const Color(0xff051220)),
                decoration: InputDecoration(
                  // 表单提示信息
                  hintText: "请输入账号",
                  hintStyle: TextStyle(
                      fontSize: 32.sp, color: const Color(0xff737A83)),
                  // 取消自带的下边框
                  border: InputBorder.none,
                ),
                onSaved: (String? value) => {
                      _account = value!,
                    },
                onChanged: (String value) => _account = value,
                onTap: () {
                  setState(() {
                    _passwordBorderColor = Colors.white;
                    _accountBorderColor = const Color(0xff2692F0);
                  });
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ]),
          ),
        ],
      ),
    );
  }

  ///密码
  Container buildPasswordTextField() {
    return Container(
      padding: EdgeInsets.only(top: 34.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "密码",
            style: TextStyle(fontSize: 32.sp, color: const Color(0xff737A83)),
          ),
          Container(
              height: 90.w,
              padding: EdgeInsets.only(left: 40.w),
              margin: EdgeInsets.only(top: 24.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: const Color(0xffEEEFF2),
                  border: Border.all(color: _passwordBorderColor, width: 1.w)),
              child: Row(
                children: [
                  SizedBox(
                    width: 450.w,
                    child: TextFormField(
                        initialValue: _password,
                        style: TextStyle(
                            fontSize: 32.sp, color: const Color(0xff051220)),
                        decoration: InputDecoration(
                          // 表单提示信息
                          hintText: "请输入密码",
                          hintStyle: TextStyle(
                              fontSize: 32.sp, color: const Color(0xff737A83)),
                          // 取消自带的下边框
                          border: InputBorder.none,
                        ),
                        obscureText: _isObscure,
                        onSaved: (String? value) => _password = value!,
                        onChanged: (String value) => _password = value,
                        onTap: () {
                          setState(() {
                            _accountBorderColor = Colors.white;
                            _passwordBorderColor = const Color(0xff2692F0);
                          });
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ]),
                  ),
                  const Expanded(child: Text("")),
                  IconButton(
                      iconSize: 30.w,
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: _eyeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _eyeColor = _isObscure ? Colors.blue : Colors.grey;
                          _isObscure = !_isObscure;
                        });
                      })
                ],
              )),
        ],
      ),
    );
  }

  ///登录按钮
  SizedBox buildLoginButton() {
    return SizedBox(
      width: 630.w,
      child: CommonWidget.buttonWidget(
          title: '登录',
          padding: const EdgeInsets.only(left: 0, right: 0),
          callBack: () {
            if ((_formKey.currentState as FormState).validate()) {
              onSubmit(context);
            }
          }),
    );
  }

  /// 点击空白  关闭输入键盘
  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  ///执行提交方法
  void onSubmit(BuildContext context) {
    closeKeyboard(context);
    if (_account.trim().isEmpty) {
      ToastUtils.toast("账号不能为空");
    } else if (_password.trim().isEmpty) {
      ToastUtils.toast("密码不能为空");
    } else {
      Map<String, dynamic> data = {
        'username': _account.trim(),
        'password': base64Encode(utf8.encode(_password.trim().trim())),
        'rememberMe': 'true',
        'ismoble': 'ismoble'
      };
      List<String> loginInfo;
      if (data['username'] == 'admin' &&
          data['password'] == base64Encode(utf8.encode('admin123'))) {
        loginInfo = [
          data['username'],
          data['password'],
          '管理员',
          'http://c.hiphotos.baidu.com/image/pic/item/9c16fdfaaf51f3de1e296fa390eef01f3b29795a.jpg'
        ];
        sharedAddAndUpdate("loginInfo", List, loginInfo); //把登录信息保存到本地
        Get.offNamed("/home");
      } else {
        ToastUtils.toast('用户名或密码错误');
      }
    }
  }
}
