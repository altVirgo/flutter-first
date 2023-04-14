import 'package:flutter/material.dart';
import 'package:flutter_first/utils/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_first/router/global_route.dart';

final GlobalRouter router = GlobalRouter();
void main() {
  // BrnInitializer.register(allThemeConfig: TestConfigUtils.defaultAllConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(750, 1334),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ToastUtils.init(GetMaterialApp(
            key: navigatorKey,
            title: '模仿微信',
            // 不显示debug标签
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: router.getRoutes,
          ));
        });
  }
}
