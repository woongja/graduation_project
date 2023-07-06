import 'package:flutter/material.dart';
import 'Camera_Page.dart';
import 'Setting_page.dart';
import 'past.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 5,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              CameraPage();
              print('cam');
            },
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            'PoFa',
            style: TextStyle(
              fontFamily: 'SDS',
              fontSize: 32,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_backup_restore_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: SafeArea(child: Container()),
      ),
    );
  }
}
