import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_app/FirstPage.dart';

class PhotoPreview extends StatelessWidget {
  final String imagePath;

  const PhotoPreview({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PoFa',
          style: TextStyle(
            fontFamily: 'SDS',
            fontSize: 32,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
                primary: Colors.white),
            onPressed: () {
              final image = Image.file(File(imagePath));

              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Text('전송되었습니다.',
                        style: TextStyle(
                          fontFamily: 'SDS',
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                        )),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: FirstPage('$imagePath')),
                          );

                          print('$imagePath');
                          print('FirstPage');
                        },
                        child: Text(
                          '확인',
                          style: TextStyle(
                            fontFamily: 'SDS',
                            color: Color.fromRGBO(16, 37, 231, 1),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              '전송',
              style: TextStyle(
                fontFamily: 'SDS',
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.file(
            File(imagePath),
          ),
        ),
      ),
    );
  }
}
