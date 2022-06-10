import 'package:flutter/material.dart';

class EnableHotreloadDialog extends StatefulWidget {
  const EnableHotreloadDialog({Key? key}) : super(key: key);

  @override
  State<EnableHotreloadDialog> createState() => _HogeState();
}

class _HogeState extends State<EnableHotreloadDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text('ここのテキストを変えてHotReload'),
                    );
                  },
                );
              },
              child: const Text('HotReloadできない'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DemoDialog();
                  },
                );
              },
              child: const Text('HotReloadできる'),
            ),
          ],
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
