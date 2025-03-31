import 'package:flutter/material.dart';
//this cor will customize the movement from one to second screen

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Animation Demo'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to my second interface'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
            //createRoute is the method i will used to customize the transition
          },
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 3),
        pageBuilder: (context, animation, secondaryAnimation) => Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end). chain(CurveTween(curve: curve));
      return SlideTransition(
          position: animation.drive(tween),
        child: child,
      );
    }
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome to second'),
      ),
    );
  }
}
