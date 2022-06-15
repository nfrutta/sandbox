import 'dart:math';

import 'package:flutter/material.dart';

class Janken extends StatelessWidget {
  const Janken({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = '引き分け';

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐';
      default:
        return '✊';
    }
  }

  void judge() {
    // 引き分け
    if (myHand == computerHand) {
      result = '引き分け';
      // 勝ち
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '✊') {
      result = '勝ち';
      // 負け
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 80),
            Text(
              computerHand,
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
            const SizedBox(height: 64),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      selectHand('✊');
                    },
                    child: const Text(
                      '✊',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      selectHand('✌️');
                    },
                    child: const Text(
                      '✌️',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      selectHand('🖐');
                    },
                    child: const Text(
                      '🖐',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
