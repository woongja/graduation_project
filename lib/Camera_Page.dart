import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'FirstPage.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  //플러터 앱이 실행될 중비가 되었는지 확인
  WidgetsFlutterBinding.ensureInitialized();

  //핸드폰에 있는 카메라들 가져오기
  _cameras = await availableCameras();
  runApp(CameraPage());
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  //카메라를 제어할 수 있는 controller 선언
  late CameraController controller;

  @override
  void initState() {
    super.initState();

    initializeCamera();
  }

  initializeCamera() async {
    try {
      //첫 번째 카메라로 카메라 설정하기
      controller = CameraController(_cameras[0], ResolutionPreset.veryHigh);
      //카메라 초기화
      await controller.initialize();

      setState(() {});
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('카메라 접근이 제한되었습니다.');
            break;
          default:
            print('오류가 발생했습니다.');
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    //controller 삭제
    controller.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    //카메라 초기화 상태 확인
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      //카메라 보여주기
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cam'),
        ),
        body: CameraPreview(
          controller,
        ),
      ),
    );
  }
}
