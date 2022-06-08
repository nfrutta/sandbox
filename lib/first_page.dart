import 'package:flutter/material.dart';
import 'package:sandbox/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sandbox'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                    fullscreenDialog: true, // 下からせり上がってくる
                  ),
                );
              },
              child: const Text('次の画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
