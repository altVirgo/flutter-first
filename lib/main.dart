import 'package:flutter/material.dart';
import './room/index.dart';
import './contact/index.dart';
import './discovery/index.dart';
import './center/index.dart';

void main() {
  // BrnInitializer.register(allThemeConfig: TestConfigUtils.defaultAllConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          _getBottomNavItem('聊天室', 'assets/icon01.png', 'assets/icon01.png', 0),
          _getBottomNavItem('通讯库', 'assets/icon02.png', 'assets/icon02.png', 1),
          _getBottomNavItem('发现', 'assets/icon03.png', 'assets/icon03.png', 2),
          _getBottomNavItem(
              '个人中心', 'assets/icon04.png', 'assets/icon04.png', 3),
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
