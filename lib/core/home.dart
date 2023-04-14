import 'package:flutter/material.dart';
import 'package:flutter_first/core/room/index.dart';
import 'package:flutter_first/core/contact/index.dart';
import 'package:flutter_first/core/discovery/index.dart';
import 'package:flutter_first/core/center/index.dart';
// import 'package:flutter_first/router/global_route.dart';

void main() {
  // BrnInitializer.register(allThemeConfig: TestConfigUtils.defaultAllConfig);
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  static const List<Widget> _homeWidgets = [
    RoomPage(),
    ContactPage(),
    DiscoverPage(),
    CenterPage(),
  ];

  void _onBottomNagigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: IndexedStack(
        index: _index,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNagigationBarTapped,
        items: [
          _getBottomNavItem(
              '聊天室', 'assets/images/icon01.png', 'assets/images/icon01.png', 0),
          _getBottomNavItem(
              '通讯库', 'assets/images/icon02.png', 'assets/images/icon02.png', 1),
          _getBottomNavItem(
              '发现', 'assets/images/icon03.png', 'assets/images/icon03.png', 2),
          _getBottomNavItem('个人中心', 'assets/images/icon04.png',
              'assets/images/icon04.png', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      icon: _index == index
          ? Image.asset(
              pressedIcon,
              width: 32,
              height: 28,
            )
          : Image.asset(
              normalIcon,
              width: 32,
              height: 28,
            ),
      label: title,
    );
  }
}
