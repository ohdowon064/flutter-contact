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
            title: Align(
          alignment: Alignment.centerLeft,
          child: Text("앱임"),
        )),
        body: SizedBox(
          child: ElevatedButton(
            child: Text("버튼임"),
            onPressed: () {
              print("버튼 눌림");
            },
          ),
        ),
      ),
    );
  }
}
