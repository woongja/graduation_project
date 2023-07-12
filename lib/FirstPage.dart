import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'camera_page.dart';
import 'setting_page.dart';
import 'history_page.dart';

Widget _brandtest(BuildContext context) {
  final List<String> brand_name = [
    'adidas',
    'gucci',
    'chanel',
    'musinsa',
    'nike',
    'vans'
  ];
  final List<String> brand_url = [
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/chanel.png',
    'assets/images/musinsa.png',
    'assets/images/nike.png',
    'assets/images/vans.png'
  ];
  return GridView.builder(
    itemCount: brand_name.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
      childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
      mainAxisSpacing: 10, //수평 Padding
      crossAxisSpacing: 10, //수직 Padding
    ),
    itemBuilder: (BuildContext context, int index) {
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(brand_url[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Text('순서대로 ${brand_name[index]}')));
    },
  );
}

Widget listviewSeperate() {
  return ListView.separated(
      scrollDirection:
          Axis.vertical, //vertical : 수직으로 나열 / horizontal : 수평으로 나열
      separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
          ), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)
      itemCount: 7, //리스트의 개수
      itemBuilder: (BuildContext context, int index) {
        //리스트의 반목문 항목 형성
        return Container(
          height: 70,
          color: Colors.pink[index * 100],
          alignment: Alignment.center,
          child: Text('item : $index'),
        );
      });
}

Widget _brandList() {
  final List<String> brand_name = <String>[
    'adidas',
    'gucci',
    'chanel',
    'musinsa',
    'nike',
    'vans'
  ];
  final List<String> brand_url = <String>[
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/chanel.png',
    'assets/images/musinsa.png',
    'assets/images/nike.png',
    'assets/images/vans.png'
  ];
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.square_foot_outlined,
                size: 40,
              ),
              Text('data'),
            ],
          ),
        ],
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
                      height: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...brandData['sports']!.map((song) {
                                String imgUrl = song['imgUrl']!;
                                String name = song['name']!;
                                return box(name, imgUrl);
                              }),
                            ],
                          ),
                        ),
                        /*Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: brand.map((name) {
                              return box(name, Colors.red);
                            }).toList(),
                          ),
                        ),*/
                      ],
                    ),
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

Widget box(String title, String imgUrl) {
  return Container(
    margin: EdgeInsets.all(10),
    width: 80,
    alignment: Alignment.center,
    decoration: BoxDecoration(),
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
