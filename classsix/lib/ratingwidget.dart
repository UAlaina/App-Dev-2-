import 'package:flutter/material.dart';

class Ratingwidget extends StatelessWidget {
  const Ratingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        SizedBox(width: 8),
        Text('176 Review')
      ],
    );
  }
}
