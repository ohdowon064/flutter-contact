import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var contacts = {
    0: ["홍길동", "010-1234-5678"],
    1: ["김길동", "010-1234-5678"],
    2: ["가길동", "010-1234-5678"],
    3: ["나길동", "010-1234-5678"],
    4: ["다길동", "010-1234-5678"]
  };

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
        leading: IconButton(
          icon: Icon(Icons.format_list_numbered_sharp),
          onPressed: () {
            setState(
              () {
                var sortedContacts = {};
                var contactsList = contacts.values.toList();
                contactsList.sort((a, b) => a[0].compareTo(b[0]));
                for (int i = 0; i < contactsList.length; i++) {
                  sortedContacts[i] = contactsList[i];
                }
                contacts = sortedContacts.cast();
              },
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: ListTile(
              title: Text(contacts[index]![0]),
              subtitle: Text(contacts[index]![1]),
              leading: Icon(Icons.person, size: 40),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        contacts.remove(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DialogUI(
                                  thisName: contacts[index]![0],
                                  thisPhoneNumber: contacts[index]![1],
                                  currentIndex: index,
                                  editContact: editContact);
                            });
                      },
                      icon: Icon(Icons.edit)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogUI(
                  thisName: null,
                  thisPhoneNumber: null,
                  currentIndex: null,
                  addContact: addContact,
                  editContact: editContact);
            },
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI(
      {Key? key,
      this.thisName,
      this.thisPhoneNumber,
      this.currentIndex,
      this.addContact,
      this.editContact})
      : super(key: key);
  var thisName;
  var thisPhoneNumber;
  final currentIndex;
  final addContact;
  final editContact;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: thisName,
              ),
              onChanged: (name) {
                thisName = name;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: thisPhoneNumber,
              ),
              onChanged: (phoneNumber) {
                thisPhoneNumber = phoneNumber;
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("취소")),
            TextButton(
                onPressed: () {
                  if (thisName == "" || thisPhoneNumber == "") {
                    return;
                  }
                  if (currentIndex == null) {
                    addContact(thisName, thisPhoneNumber);
                  } else {
                    editContact(currentIndex, thisName, thisPhoneNumber);
                  }
                  Navigator.pop(context);
                },
                child: Text("확인")),
          ],
        ),
      ),
    );
  }
}
