import 'package:flutter/material.dart';
import 'package:sandbox/second_page.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //   onPressed: () {},
            //   child: const Text('TextButton'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('ElevatedButton'),
            // ),
            // OutlinedButton(
            //   onPressed: () {},
            //   child: const Text('ElevatedButton'),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
                onChanged: (text) {
                  nameText = text;
                },
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(nameText),
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
