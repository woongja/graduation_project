import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_app/FirstPage.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'history_page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 5,
          centerTitle: true,
          title: Text(
            'history',
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.topToBottom, child: FirstPage()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ),
    );
  }
}
