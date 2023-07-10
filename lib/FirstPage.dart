import 'package:flutter/material.dart';
import 'camera_page.dart';
import 'setting_page.dart';
import 'history_page.dart';

final brandItem = {
  "brand": [
    {"image": "assets/images/adidas.png", "name": "adidas"},
    {"image": "assets/images/gucci.png", "name": "gucci"},
    {"image": "assets/images/chanel.png", "name": "chanel"},
    {"image": "assets/images/musinsa.png", "name": "musinsa"},
    {"image": "assets/images/nike.png", "name": "nike"},
    {"image": "assets/images/vans.png", "name": "vans"},
  ]
};

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraPage()),
              );
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
              icon: Icon(
                Icons.settings_backup_restore_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
                print('setting_page');
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Expanded(
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        //width: MediaQuery.of(context).size.width /2 로 구현 가능
                        flex: 5,
                        child: Center(
                          child: Container(
                            height: 320,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Column(
                          children: [
                            Container(
                              height: 160,
                              color: Colors.deepOrange,
                            ),
                            Container(height: 160, color: Colors.yellow)
                          ],
                        ),
                      ),
                      Divider(),
                      Container(),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
