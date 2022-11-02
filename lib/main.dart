import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text("앱임"),
          ),
          actions: [
            Icon(Icons.search),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
