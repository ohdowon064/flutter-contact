import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print("허락됨");
      var myContacts = await ContactsService
          .getContacts(); // 오래걸리는 코드는 async 가능하면 await 붙이자.
      setState(() {
        contacts = myContacts;
      });
    } else if (status.isDenied) {
      print("거부됨");
      Permission.contacts.request();
      openAppSettings();
    }
  }

  var contacts = [];

  addContact(name, phoneNumber) {
    setState(() {
      var newPerson = Contact();
      newPerson.displayName = name;
      newPerson.phones = [Item(label: "mobile", value: phoneNumber)];
      ContactsService.addContact(newPerson);
      contacts.add(newPerson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contacts.length.toString()),
        actions: [
          IconButton(
            onPressed: () {
              getPermission();
            },
            icon: Icon(Icons.contacts),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: ListTile(
              title: Text(contacts[index]!.displayName),
              leading: Icon(Icons.person, size: 40),
              subtitle: Text(contacts[index]!.phones!.first.value),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(addContact: addContact);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addContact}) : super(key: key);
  final addContact;
  var currentName = '';
  var currentPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "이름을 입력하세요."),
              onChanged: (value) {
                currentName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "전화번호를 입력하세요."),
              onChanged: (value) {
                currentPhoneNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                addContact(currentName, currentPhoneNumber);
                Navigator.pop(context);
              },
              child: Text("저장"),
            )
          ],
        ),
      ),
    );
  }
}
