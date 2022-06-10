import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  String nameText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sandbox'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const DemoDialog();
              },
            );
          },
          child: const Text('HotReloadできる😭'),
        ),
      ),
    );
  }
}

class DemoDialog extends StatelessWidget {
  const DemoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Text('ここのテキストを変えてHotReload'),
    );
  }
}
