import 'package:flutter/material.dart';

class ChatBgImgsPage extends StatelessWidget {
  const ChatBgImgsPage({super.key});
  @override
  Widget build(BuildContext context) {
    int msgLenth = 1;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
              child: msgLenth == 0
                  ? const Text('微信')
                  : Text.rich(TextSpan(
                      children: [
                        const TextSpan(text: '微信('),
                        TextSpan(text: '$msgLenth'),
                        const TextSpan(text: ')')
                      ],
                    ))),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              position: PopupMenuPosition.under,
              color: const Color.fromARGB(167, 0, 0, 0),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(
                        Icons.message_outlined,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: Text('新聊天',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                  const PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(
                        Icons.group_add_outlined,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      title: Text('新增好友',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                  const PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(Icons.qr_code_scanner,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      title: Text('扫描',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                  const PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: Icon(Icons.payment_outlined,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      title: Text('收付款',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                ];
              },
            )
          ]),

      // PopupMenuButton<Text>(
      //     child: const Icon(Icons.plus_one_rounded),
      //     onSelected: (String string) {
      //       debugPrint(string.toString());
      //     },
      //     itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
      //           const PopupMenuItem(
      //             value: "新聊天",
      //             child: Text("新聊天"),
      //           ),
      //           const PopupMenuItem(
      //             value: "新增好友",
      //             child: Text("新增好友"),
      //           ),
      //           const PopupMenuItem(
      //             value: "扫描",
      //             child: Text("扫描"),
      //           ),
      //           const PopupMenuItem(
      //             value: "收付款",
      //             child: Text("收付款"),
      //           )
      //         ])),
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
