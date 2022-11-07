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
      var obtainedContacts = await ContactsService.getContacts(); // 오래걸리는 코드는 async 가능하면 await 붙이자.
      setState(() {
        contacts = obtainedContacts;
      });
      // print(contacts[0].displayName);
      var newPerson = Contact();
      newPerson.givenName = "John";
      newPerson.familyName = "Doe";
      await ContactsService.addContact(newPerson);

    }else if(status.isDenied){
      print("거부됨");
      Permission.contacts.request();
      openAppSettings();
    }
  }

  var contacts = [];

  addContact(name, phoneNumber) {
    setState(() {
      contacts[contacts.length] = [name, phoneNumber];
    });
  }

  editContact(index, name, phoneNumber) {
    setState(() {
      contacts[index] = [name, phoneNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contacts.length.toString()),
        actions: [
          IconButton(
            onPressed: () {getPermission();},
            icon: Icon(Icons.settings),
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
            ),
          );
        },
      ),
    );
  }
}
