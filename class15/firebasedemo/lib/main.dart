import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyABDH7wc0pjORwPa_GvLtG1Aur797SMuD4",
        appId: "1075562597213",
        messagingSenderId: "1075562597213",
        projectId: "winter2025session")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFSDemo(),
    );
  }
}

class MyFSDemo extends StatefulWidget {
  const MyFSDemo({super.key});

  @override
  State<MyFSDemo> createState() => _MyFSDemoState();
}

class _MyFSDemoState extends State<MyFSDemo> {
  //this will create an instance of FS database on the cloud
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create a document of user with first and last name
  void _create() async {
    try {
      await firestore.collection('users').doc('testusers').set({
        'firstname': 'John',
        'lastname': 'Wick',
      });
    } catch(e) {
      print(e);
    }
  }

  //read the data from the cloud
  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await firestore.collection('users').doc('testusers').get();
      print(documentSnapshot.data());
    } catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Fetch data from the cloud'),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: _create,
                child: Text('Add the data first'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: _read,
                child: Text('Add the data first'),
            ),
          ],
        ),
      ),
    );
  }
}
