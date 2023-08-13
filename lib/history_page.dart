import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_app/FirstPage.dart';
import 'FirstPage.dart';

class ProductModel {
  const ProductModel(this.imageUrl, this.title, this.desc1, this.desc2);
  final String imageUrl;
  final String title;
  final String desc1;
  final String desc2;
}

const productList = [
  ProductModel(
      "https://www.mdockorea.com/shopimages/mdoc/0010000001762.jpg?1624588054",
      "엠도씨",
      "남성 비타민C 집중관리 앰플",
      "생기 있는 하얀 얼굴로"),
  ProductModel(
      "http://www.schneidersports.com/data/base/goods/big/SH2M1ST95_023_01.jpg?t=1625970281",
      "슈나이더 스포츠",
      "가성비 끝판! 입은거 맞아?",
      "인기 많은 흡한속건 기능티!"),
  ProductModel("http://img.mcnplaza.com/product/500/20210701just_01.jpg",
      "고려생활건강", "더위에 강한", "숨쉬기 편한 마스크"),
];

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'brand_page',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 5,
            centerTitle: true,
            title: Text(
              'PoFa',
              style: TextStyle(
                fontFamily: 'SDS',
                fontSize: 32,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.topToBottom,
                      child: FirstPage('1')),
                );
              },
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: ListView.separated(
                        itemCount: productList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "brand_name",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  color: Colors.yellow,
                                  width: 400,
                                  height: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        color: Colors.black38,
                                        width: 150,
                                        height: 160,
                                      ),
                                      Container(
                                        color: Colors.black38,
                                        height: 160,
                                      ),
                                    ],
                                  )),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(thickness: 3);
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
