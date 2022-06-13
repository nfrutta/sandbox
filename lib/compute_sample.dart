import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeSample extends StatefulWidget {
  const ComputeSample({Key? key}) : super(key: key);

  @override
  State<ComputeSample> createState() => _DemoComputeState();
}

class _DemoComputeState extends State<ComputeSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: FlutterKazaguruma(size: 120, duration: Duration(seconds: 1))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // compute使った場合
          ElevatedButton(
            onPressed: () async {
              /// int を受け取って double を返すときはこう書く
              final result = await compute<int, double>(delaySecond, 1);
              print(result);
            },
            child: const Text('別スレッドで実行'),
          ),
          const SizedBox(width: 16),
          // 使わなかった場合
          ElevatedButton(
            onPressed: () {
              /// int を受け取って double を返すときはこう書く
              final result = delaySecond(3);
              print(result);
            },
            child: const Text('同じスレッドで実行'),
          ),
        ],
      ),
    );
  }
}

/// トップレベル関数
double delaySecond(int input) {
  sleep(const Duration(seconds: 1));
  return input * 1.0;
}

class FlutterKazaguruma extends StatelessWidget {
  const FlutterKazaguruma({
    Key? key,
    required this.size,
    required this.duration,
  }) : super(key: key);

  final double size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterWing(
          size: size,
          duration: duration,
        ),
        FlutterWing(
          size: size,
          duration: duration,
          angle: (pi / 2) * 1, // 90度回転
        ),
        FlutterWing(
          size: size,
          duration: duration,
          angle: (pi / 2) * 2, // 180度回転
        ),
        FlutterWing(
          size: size,
          duration: duration,
          angle: (pi / 2) * 3, // 270度回転
        ),
      ],
    );
  }
}

/// 風車の羽根の部分
class FlutterWing extends StatefulWidget {
  const FlutterWing({
    Key? key,
    required this.size,
    required this.duration,
    this.angle = 0,
  }) : super(key: key);
  final double size;
  final double angle;
  final Duration duration;

  @override
  State<FlutterWing> createState() => _FlutterWingState();
}

class _FlutterWingState extends State<FlutterWing>
    with SingleTickerProviderStateMixin {
  late final controller =
      AnimationController(vsync: this, duration: widget.duration)..repeat();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: widget.angle,
      child: Container(
        // 回転軸をずらすためにロゴを左下においやっています
        width: widget.size * 2,
        height: widget.size * 2,
        alignment: Alignment.bottomLeft,
        child: RotationTransition(
          turns: controller,
          // ロゴそのものの回転軸は右上にしています。
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
