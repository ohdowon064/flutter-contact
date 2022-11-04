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
  var phoneNumbers = List<String>.generate(100, (index) => "unknown phone number");
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = index;
                  });
                  showDialog(context: context, builder: (context) {
                    return ContactModal();
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.person_pin, size: 50),
                  title: Text(name[index % name.length]),
                  subtitle: Text(phoneNumbers[index]),
                ),
              );
            },
          ),
        ),
    );
  }
}

class ContactModal extends StatefulWidget {
  const ContactModal({Key? key}) : super(key: key);

  @override
  State<ContactModal> createState() => _ContactModalState();
}

class _ContactModalState extends State<ContactModal> {
  var phoneNumber = "010-0000-0000";

  @override
  Widget build(BuildContext context) {
    _MyAppState? myApp = context.findAncestorStateOfType<_MyAppState>();
    return SizedBox(
      width: 100,
      height: 100,
      child: Dialog(
        child: Column(
          children: [
            Text("${myApp?.name[myApp.currentIndex % myApp.name.length]}"),
            TextField(
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              decoration: InputDecoration(
                hintText: "input phone number",
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    myApp?.setState(() {
                      myApp.phoneNumbers[myApp.currentIndex] = phoneNumber;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

