import 'package:flutter/material.dart';

class Paragraphwidget extends StatelessWidget {
  const Paragraphwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Strawberry Pavlova features a crisp meringue base, '
        'whipped cream, and fresh strawberries. '
        'It\'s a light, '
        'refreshing dessert with a perfect balance of sweetness and tartness.',
    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
    );
  }
}
