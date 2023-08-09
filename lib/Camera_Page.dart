import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'photo_preview.dart';
import 'package:flutter/material.dart';

final picker = ImagePicker();
XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
List<XFile?> multiImage = []; // 갤러리에서 여러 장의 사진을 선택해서 저장할 변수
List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  bool _isCameraReady = false;
  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      if (cameras.isNotEmpty && _cameraController == null) {
        _cameraController = CameraController(
          cameras.first,
          ResolutionPreset.medium,
        );

        _cameraController!.initialize().then((_) {
          setState(() {
            _isCameraReady = true;
          });
        });
      }
    });
  }

  void _onTakePicture(BuildContext context) {
    _cameraController!.takePicture().then((image) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotoPreview(
            imagePath: image.path,
          ),
        ),
      );
    });
  }

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
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _cameraController != null && _isCameraReady
                  ? CameraPreview(_cameraController!)
                  : Container(
                      color: Colors.grey,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: _cameraController != null
                    ? () => _onTakePicture(context)
                    : null,
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
                    ],
                  ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
