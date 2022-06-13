import 'package:flutter/material.dart';

class CarouselSample extends StatefulWidget {
  const CarouselSample({Key? key}) : super(key: key);

  @override
  State<CarouselSample> createState() => _DemoPageState();
}

class _DemoPageState extends State<CarouselSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '説明画面でよく見るやつ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Carousel(
        indicatorColor: Colors.amber, // インジケーターの色
        indicatorAlignment: const Alignment(0, .7), // インジケーターの位置
        pages: [
          // ここにスクロールさせたい Widget を複数並べる
          Container(
            margin: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(),
              color: Colors.blue.withOpacity(.2),
            ),
            alignment: Alignment.center,
            child: const Text(
              'ページ0',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(),
              color: Colors.pink.withOpacity(.2),
            ),
            alignment: Alignment.center,
            child: const Text(
              'ページ1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(),
              color: Colors.green.withOpacity(.2),
            ),
            alignment: Alignment.center,
            child: const Text(
              'ページ2',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
    required this.pages,
    this.indicatorColor,
    this.indicatorAlignment,
  }) : super(key: key);
  final List<Widget> pages;
  final Color? indicatorColor;
  final Alignment? indicatorAlignment;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = widget.pages;
    final pageLength = pages.length;
    final color =
        widget.indicatorColor ?? Theme.of(context).colorScheme.primary;
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          onPageChanged: (value) {
            // ページが切り替わったときにそのindexがvalueに入ってくる。
            // 現在表示中のページが何番目か知りたいのでcurrentIndexにvalueを渡す。
            setState(() {
              currentIndex = value;
            });
          },
          children: widget.pages,
        ),
        Align(
          alignment: widget.indicatorAlignment ??
              const Alignment(0, .5), // 相対的な表示位置を決める。
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pageLength,
              (index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: index == currentIndex ? color : null,
                    shape: BoxShape.circle,
                    border: Border.all(color: color),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
