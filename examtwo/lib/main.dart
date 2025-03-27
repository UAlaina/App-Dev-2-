import 'package:examtwo/taskone.dart';
import 'package:examtwo/tasktwo.dart';
import 'package:flutter/material.dart';
 void main() {
   runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'user App',
       theme: ThemeData(primarySwatch: Colors.blue),
       //home: CategoryListScreen(),
       home: UserListScreen(),
     );
   }
 }
