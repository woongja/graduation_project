import 'package:flutter/material.dart';
import 'package:photo_app/FirstPage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/adidas.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text("WJ"),
              accountEmail: Text('wcn4457@gmail.com'),
              onDetailsPressed: () {
                print("arrow is click");
              },
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_2_outlined,
              ),
              title: Text('내 정보'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('내 정보'),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer_outlined,
              ),
              title: Text('내 정보'),
            ),
          ],
        ),
      ),
    );
  }
}
