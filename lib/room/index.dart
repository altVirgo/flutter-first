import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('聊天室1')),
          actions: PopupMenuButton(
              child: const Icon(Icons.plus_one_rounded),
              onSelected: (String string) {
                debugPrint(string.toString());
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    const PopupMenuItem(
                      value: "新聊天",
                      child: Text("新聊天"),
                    ),
                    const PopupMenuItem(
                      value: "新增好友",
                      child: Text("新增好友"),
                    ),
                    const PopupMenuItem(
                      value: "扫描",
                      child: Text("扫描"),
                    ),
                    const PopupMenuItem(
                      value: "收付款",
                      child: Text("收付款"),
                    )
                  ])),
      body: Scrollbar(
          child: ListView(
        restorationId: 'list_demo_list_view',
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (int index = 1; index < 21; index++)
            ListTile(
              leading: ExcludeSemantics(
                child: CircleAvatar(child: Image.asset('assets/avatar.jpeg')),
              ),
              title: Text.rich(TextSpan(
                children: [
                  const TextSpan(text: '第'),
                  TextSpan(text: '$index'),
                  const TextSpan(text: '条信息')
                ],
              )),
              subtitle: Text.rich(TextSpan(
                children: [
                  const TextSpan(text: '这是第'),
                  TextSpan(text: '$index'),
                  const TextSpan(text: '条信息，')
                ],
              )),
            ),
        ],
      )),
    );
  }
}
