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
  var name = ["홍길동", "김길동", "이길동", "박길동", "최길동"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    print(context.findAncestorWidgetOfExactType<MaterialApp>());
                    return Dialog(child: Text("Hello"));
                  });
                },
                child: Icon(Icons.smart_button),
              );
            }
          ),
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person_pin, size: 50),
                title: Text(name[index % name.length]),
                subtitle: Text('Description'),
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
