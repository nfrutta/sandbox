import 'package:flutter/material.dart';

class StatefulwidgetSample extends StatefulWidget {
  const StatefulwidgetSample({Key? key}) : super(key: key);

  @override
  State<StatefulwidgetSample> createState() => _SamplePageState();
}

class _SamplePageState extends State<StatefulwidgetSample> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count += 10;
    loop();
  }

  Future<void> loop() async {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      count++;
      print(count);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$count'),
      ),
    );
  }
}
