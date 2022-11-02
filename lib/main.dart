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
        appBar: AppBar(),
        body: Row(
          children: [
            Flexible(child: Container(color: Colors.blue), flex: 5,),
            Flexible(child: Container(color: Colors.green), flex: 5),
            Flexible(child: Container(color: Colors.red), flex: 5),
          ],
        ),
      ),
    );
  }
}
