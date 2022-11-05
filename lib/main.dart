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
  var itemCount = 20;
  var phoneNumbers =
      List<String>.generate(20, (index) => "unknown phone number");
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(name[index % 5]),
              subtitle: Text(phoneNumbers[index]),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogUI(state: itemCount);
                    });
              },
            );
          },
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key, this.state}) : super(key: key);
  final state;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text(state.toString()),
            TextField(),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
