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
      body: Container(),
    );
  }
}
