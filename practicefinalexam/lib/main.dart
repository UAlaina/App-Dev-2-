import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/todo_list.dart';
import 'screens/bmi_calculator.dart';
import 'screens/quiz.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBlWclyEwrTpoAJsmydNftmuhe70SskTPI",
        appId: "490893815654",
        messagingSenderId: "490893815654",
        projectId: "finalexampractice-ef130")
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Feature Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/todo': (context) => TodoListScreen(),
        '/bmi': (context) => BmiCalculatorScreen(),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}