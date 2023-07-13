import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'camera_page.dart';
import 'setting_page.dart';
import 'history_page.dart';

Widget brandList(String category) {
  const brandData = {
    'sports': [
      {'name': 'adidas', 'imgUrl': 'assets/images/adidas.png'},
      {'name': 'nike', 'imgUrl': 'assets/images/nike.png'},
    ],
    'casual': [
      {'name': 'gucci', 'imgUrl': 'assets/images/gucci.png'},
      {'name': 'chanel', 'imgUrl': 'assets/images/chanel.png'},
      {'name': 'musinsa', 'imgUrl': 'assets/images/musinsa.png'},
      {'name': 'vans', 'imgUrl': 'assets/images/vans.png'},
    ],
  };
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          '$category',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'SDS',
              //fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
      ),
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...brandData['$category']!.map((song) {
              String imgUrl = song['imgUrl']!;
              String name = song['name']!;
              return box(name, imgUrl);
            }),
          ],
        ),
      ),
    ],
  );
}

//페이지 구성 상단 중단 하단 or 상단 중단 나눠서 widget으로 개발 후 scaffold에 구현해주기

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const brandData = {
      'sports': [
        {'name': 'adidas', 'imgUrl': 'assets/images/adidas.png'},
        {'name': 'nike', 'imgUrl': 'assets/images/nike.png'},
      ],
      'casual': [
        {'name': 'gucci', 'imgUrl': 'assets/images/gucci.png'},
        {'name': 'chanel', 'imgUrl': 'assets/images/chanel.png'},
        {'name': 'musinsa', 'imgUrl': 'assets/images/musinsa.png'},
        {'name': 'vans', 'imgUrl': 'assets/images/vans.png'},
      ],
    };

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
                PageTransition(
                    type: PageTransitionType.leftToRight, child: CameraPage()),
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
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
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
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text('setting'),
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                ),
                title: Text('Wish List'),
              ),
              ListTile(
                leading: Icon(
                  Icons.question_answer_outlined,
                ),
                title: Text('QnA'),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Expanded(
            child: ListView(
              children: [
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
                      ],
                    ),
                    Divider(
                      height: 20,
                    ),
                    brandList('sports'),
                    brandList('casual')
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop, child: HistoryPage()),
            );
            print('cam');
          },
          backgroundColor: Colors.black87,
          child: Icon(Icons.history),
        ),
      ),
    );
  }
}

Widget box(String title, Object imgUrl) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$imgUrl'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
