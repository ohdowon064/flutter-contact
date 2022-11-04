import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var itemCount = 100;
  var name = ["홍길동", "김길동", "이길동", "박길동", "최길동"];
  var likes = List<int>.generate(100, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${likes[index]}"),
              title: Text(name[index % name.length]),
              subtitle: Text('Description'),
              trailing: TextButton(
                onPressed: () {
                  setState(() {
                    likes[index]++;
                  });
                },
                child: SizedBox(
                  child: Text(
                    "좋아요",
                    style: TextStyle(
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.phone),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.contact_page),
            ),
          ],
        ),
      ),
    );
  }
}
