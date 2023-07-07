import 'package:flutter/material.dart';
import 'camera_page.dart';
import 'setting_page.dart';
import 'FirstPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              children: [
                CameraPage(),
                FirstPage(),
                SettingPage(),
              ],
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.topCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
