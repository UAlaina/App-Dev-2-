import 'package:flutter/material.dart';

class Image extends StatelessWidget {
  const Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/straw.jpeg', fit: BoxFit.cover,
    );
  }
}
