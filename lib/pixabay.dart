import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Pixabay extends StatelessWidget {
  const Pixabay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List imageList = [];

  Future<void> fetchImages(String text) async {
    var apiKey = const String.fromEnvironment("API_KEY");
    Response response = await Dio().get(
      'https://pixabay.com/api/?key=$apiKey&q=$text&image_type=photo&pretty=true&per_page=100',
    );
    imageList = response.data['hits'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchImages('猫');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (text) {
            print(text);
            fetchImages(text);
          },
        ),
      ),
      body: imageList == []
          ? const CircularProgressIndicator()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> image = imageList[index];
                return InkWell(
                  onTap: () async {
                    Directory dir = await getTemporaryDirectory();
                    Response response = await Dio().get(
                      image['webformatURL'],
                      options: Options(
                        responseType: ResponseType.bytes,
                      ),
                    );

                    File imageFile = await File('${dir.path}/image.png')
                        .writeAsBytes(response.data);

                    await Share.shareFiles([imageFile.path]);
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        image['previewURL'],
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(image['likes'].toString()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
