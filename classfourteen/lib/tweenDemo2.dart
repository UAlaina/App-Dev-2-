import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      //ongenerateRoute will choose the transition dynamically
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
                child: SecondPage(),
                type: PageTransitionType.fade,
            duration: Duration(seconds: 3),
            settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
              Navigator.push(context, PageTransition(
                  child: SecondPage(),
                  curve: Curves.bounceOut,
                  alignment: Alignment.topCenter,
                  type: PageTransitionType.rotate
              ));
            },
                child: Text('Transition Button'))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome to second'),
      ),
    );
  }
}

