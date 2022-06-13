import 'package:flutter/material.dart';

class ButtonTextColorCustom extends StatefulWidget {
  const ButtonTextColorCustom({Key? key}) : super(key: key);

  @override
  State<ButtonTextColorCustom> createState() => _DemoPageState();
}

class _DemoPageState extends State<ButtonTextColorCustom> {
  final colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.orange,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lightGreen,
    Colors.lime,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.yellow,
  ];

  Color selectedColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 160,
              width: 160,
              child: CustomElevatedButton(
                primaryColor: selectedColor,
                text: 'ボタン',
                onPressed: () {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: colors
                  .map(
                    (e) => Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = e;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: e,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

extension OnPrimary on Color {
  /// 輝度が高ければ黒, 低ければ白を返す
  Color get onPrimary {
    // 輝度により黒か白かを決定する
    if (computeLuminance() < 0.5) {
      return Colors.white;
    }
    return Colors.black;
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.primaryColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final Color primaryColor;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: primaryColor.onPrimary, // ここで文字色が決定される
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
