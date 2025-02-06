import 'package:flutter/material.dart';
import 'titlewidget.dart';
import 'paragraphwidget.dart';
import 'ratingwidget.dart';
import 'iconswidget.dart';

void main() {
  runApp(const Strawberry());
}

class Strawberry extends StatelessWidget {
  const Strawberry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Strawberry pavlova'),
        ),
        body: SingleChildScrollView( // Wrap everything inside the SingleChildScrollView
          child: Column(
            children: [
              // Image at the top
              Image.asset(
                'assets/straw.jpg',
                width: 400,
                height: 250,
                fit: BoxFit.cover,
              ),
              // Padding and widgets below the image
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titlewidget(),
                    SizedBox(height: 16),
                    Paragraphwidget(),
                    SizedBox(height: 16),
                    Iconswidget(),
                    SizedBox(height: 16),
                    Ratingwidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
