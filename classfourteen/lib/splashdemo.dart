import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreenDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySplashScreenDemo extends StatefulWidget {
  const MySplashScreenDemo({super.key});

  @override
  State<MySplashScreenDemo> createState() => _MySplashScreenDemoState();
}

class _MySplashScreenDemoState extends State<MySplashScreenDemo> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
      () => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => SecondScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height,),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome page'),
      ),
    );
  }
}
