import 'package:flutter/material.dart';

void main() {
  runApp(project());
}

class project extends StatelessWidget {
  const project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My first flutter application'),
        ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  } //scaffold
}

