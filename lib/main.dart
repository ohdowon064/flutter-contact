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
                setState(() {
                  currentIndex = index;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogUI(
                      currentIndex: currentIndex,
                      phoneNumbers: phoneNumbers,
                      itemCount: itemCount,
                      name: name,
                      setPhoneNumber: (phoneNumber, currentIndex) {
                        setState(() {
                          phoneNumbers[currentIndex] = phoneNumber;
                        });
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI(
      {Key? key,
      this.currentIndex,
      this.phoneNumbers,
      this.itemCount,
      this.name,
      this.setPhoneNumber})
      : super(key: key);
  final currentIndex;
  final phoneNumbers;
  final itemCount;
  final name;
  final setPhoneNumber;
  var phoneNumber = "010-0000-0000";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text(name[currentIndex % name.length]),
            TextField(
              decoration: InputDecoration(hintText: phoneNumbers[currentIndex]),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setPhoneNumber(phoneNumber, currentIndex);
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
