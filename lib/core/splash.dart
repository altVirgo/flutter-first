import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_first/utils/shared_preferences_util.dart';
import 'package:flutter_first/utils/string_util.dart';
import 'package:flutter_first/utils/toast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const duration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    ///查询本地保存的登录信息
    sharedGetData("loginInfo", List).then((data) {
      if (StringUtil.isNotEmpty(data)) {
        List<String> loginInfo = data as List<String>;
        var queryParameters = {
          'username': loginInfo[0],
          'password': loginInfo[1],
          'rememberMe': 'true',
          'ismoble': 'ismoble'
        };
        if (queryParameters['username'] == 'admin' &&
            queryParameters['password'] ==
                base64Encode(utf8.encode('admin123'))) {
          Future.delayed(duration, () => Get.offNamed("/home"));
        } else {
          ToastUtils.toast('登录失败，用户名密码已过期请重新登录');
          Get.offNamed("/login");
        }
      } else {
        Future.delayed(duration, () => Get.offNamed("/login"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.fill,
            width: 750.w,
            height: 1440.h,
          ),
        ),
      ),
    );
  }
}
