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
  var total = 5;
  var name = ["홍길동", "김길동", "이길동", "박길동", "최길동"];
  var currentIndex = 0;

  addPerson(personName){
    setState(() {
      total++;
      name.add(personName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(total.toString())),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogUI(
                    addPerson: addPerson,
                  );
                },
              );
            },
            child: Icon(Icons.add),
          );
        }),
        body: ListView.builder(
          itemCount: total,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(name[index % name.length]),
            );
          },
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addPerson}) : super(key: key);
  final addPerson;
  var inputName = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text("Dialog"),
            Container(
              width: 250,
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                onChanged: (text) {
                  inputName = text;
                },
                onSubmitted: (text) {
                  addPerson(text);
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소")),
                TextButton(
                  onPressed: () {
                    addPerson(inputName);
                    Navigator.pop(context);
                  },
                  child: Text("완료"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
