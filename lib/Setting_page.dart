import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/FirstPage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setting_page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 5,
          centerTitle: true,
          title: Text(
            'setting',
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
              );
            },
            icon: Icon(Icons.keyboard_backspace),
          ),
        ),
      ),
    );
  }
}
