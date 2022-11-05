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
  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(total.toString())),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogUI(addOne: addOne,);
                  },
                );
              },
              child: Icon(Icons.add),
            );
          }
        ),
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
  const DialogUI({Key? key, this.addOne}) : super(key: key);
  final addOne;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text("Dialog"),
            TextField(),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소")),
                TextButton(
                  onPressed: () {
                    addOne();
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
