import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the firebase
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCFuobJMDpEqfoCw1MtPYtDfotFN8pgeKc",
          appId: "429133576399",
          messagingSenderId: "429133576399",
          projectId: "class16projectdemo"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreDemo2(),
    );
  }
}

class FirestoreDemo2 extends StatefulWidget {
  const FirestoreDemo2({super.key});

  @override
  State<FirestoreDemo2> createState() => _FirestoreDemo2State();
}

class _FirestoreDemo2State extends State<FirestoreDemo2> {
  // create a stream that gets the data as a snapshot
  final Stream<QuerySnapshot> _userStream =
  FirebaseFirestore.instance.collection('Users').snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String name = '';
  String password = '';

  // adduser
  Future<void> addUser() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      try {
        await users.add({'name': name, 'password': password});
        print('user addded');
        setState(() {
          name = '';
          password = '';
        });
      } catch (error) {
        print("failed to add the user : $error");
      }
    } else {
      print("Enter a valid name and password");
    }
  }

  // update the user
  Future<void> updateUser(String id, String newName, String newPassword) async {
    if (newName.isNotEmpty && newPassword.isNotEmpty) {
      try {
        await users.doc(id).update({'name': newName, 'password': newPassword});
      } catch (error) {
        print("failed to update the user : $error");
      }
    } else {
      print("Enter a valid name and password");
    }
  }

  // delete the user
  Future<void> deleteUser(String id) async {
    try {
      await users.doc(id).delete();
      print('user deleted');
    } catch (error) {
      print("failed to delete the user : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter UserName',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter the username here',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter the password here',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: addUser, child: Text('Add data to FS')),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                  stream: _userStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    // this is used to manipulate live data
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading...");
                    }
                    return ListView(
                      shrinkWrap: true,
                      children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        String docId = document.id;
                        return ListTile(
                          title: Text(data['name']),
                          subtitle: Text('password : ${data['password']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          String newName = data['name'];
                                          String newPassword = data['password'];
                                          return AlertDialog(
                                            title: Text("edit user"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    newName = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText:
                                                      'Enter new name'),
                                                  controller:
                                                  TextEditingController(
                                                    text: data['name'],
                                                  ),
                                                ),
                                                TextField(
                                                  onChanged: (value) {
                                                    newPassword = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText:
                                                      'Enter new password'),
                                                  controller:
                                                  TextEditingController(
                                                    text: data['password'],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    updateUser(docId, newName,
                                                        newPassword);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:
                                                  Text('Update the user'))
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    deleteUser(docId);
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}