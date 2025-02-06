import 'package:flutter/material.dart';

class Iconswidget extends StatelessWidget {
  const Iconswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return //Padding(padding: EdgeInsets.all(32),
     // child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.timer, color: Colors.lightGreen),
            SizedBox(height: 8),
            Text('PREP:'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.lightGreen),
            SizedBox(height: 8),
            Text('COOK:'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.restaurant, color: Colors.lightGreen),
            SizedBox(height: 8),
            Text('FEEDS:'),
          ],
        ),
      ],
    );
  }
}
