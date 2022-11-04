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
  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              a++;
            });
          },
          child: Text(a.toString()),
        ),
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Profile();
          },
        ),
        bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.person_pin, size: 40),
        title: Text('Name'),
        subtitle: Text('Description'),
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
