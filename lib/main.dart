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
            appBar: AppBar(title: Align(alignment: Alignment.centerLeft, child: Text("앱임"),)),
            body: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.infinity, height: 150,
                margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("안녕하세요"),
              ),
            )
        )
    );
  }
}
