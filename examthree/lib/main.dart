import 'package:examthree/screens/create_screen.dart';
import 'package:examthree/screens/delete_screen.dart';
import 'package:examthree/screens/read_screen.dart';
import 'package:examthree/screens/update_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCVXgvpbEzA0T-1156iI3tOqRQUuEvQ0Uk",
          appId: "902814138968",
          messagingSenderId: "902814138968",
          projectId: "phonebook-15aae")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    CreateScreen(),
    ReadScreen(),
    UpdateScreen(),
    DeleteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.pinkAccent),
              backgroundColor: Colors.purple,
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.amberAccent),
              backgroundColor: Colors.amber,
              label: 'Read',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update, color: Colors.cyanAccent),
              backgroundColor: Colors.cyan,
              label: 'Update',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, color: Colors.black),
              backgroundColor: Colors.grey,
              label: 'Delete',
            ),
          ],
        ),
    );
  }
}