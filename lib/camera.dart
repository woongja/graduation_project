import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'FirstPage.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
    // final appDir = await syspath.getApplicationDocumentsDirectory();
    // final fileName = path.basename(image!.path);
    final savedfile =
        await _image!.copy('/Users/woongjae/Desktop/gradu/project');
  }

  // 이미지를 보여주는 위젯
  Widget showImage(context) {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      backgroundColor: Colors.white,
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
              final image = showImage(context);

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
                                child: FirstPage('1')),
                          );
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Expanded(
              flex: 1,
              child: showImage(context),
            ),
            // 카메라 촬영 버튼
            TextButton(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.black,
                      ),
                    ]),
                child: Center(
                  child: const Text(
                    'Take a photo',
                    style: TextStyle(
                      fontFamily: 'SDS',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                getImage(ImageSource.camera);
              },
            ),
          ],
        ),
        //갤러리에서 이미지를 가져오는 버튼
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.wallpaper),
        tooltip: 'pick Iamge',
        onPressed: () {
          getImage(ImageSource.gallery);
        },
      ),
    );
  }
}
