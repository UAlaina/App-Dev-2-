import 'package:flutter/material.dart';

class Titlewidget extends StatelessWidget {
  const Titlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Strawberry pavlova',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
