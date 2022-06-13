import 'package:flutter/material.dart';

class TapCreateWidget extends StatefulWidget {
  const TapCreateWidget({Key? key}) : super(key: key);

  @override
  State<TapCreateWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<TapCreateWidget> {
  final widgets = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タップした位置にWidgetを生成したい'),
      ),
      body: GestureDetector(
        onTapDown: (tapDownDetails) {
          widgets.add(
            Positioned(
              left: tapDownDetails.localPosition.dx,
              top: tapDownDetails.localPosition.dy,
              child: const FlutterLogo(),
            ),
          );
          setState(() {});
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            ...widgets,
            // tap できる領域を確保
            Container(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widgets.clear();
          setState(() {});
        },
        child: const Icon(Icons.cleaning_services),
      ),
    );
  }
}
