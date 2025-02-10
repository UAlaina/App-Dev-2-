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
          title: Text('Strawberry Pavlova'),
        ),
        body: SingleChildScrollView( // Wrap everything inside the SingleChildScrollView
          child: Column(
            children: [
              // Image at the top
              Image.asset(
                'assets/straw.jpg', // Ensure the image is in the correct directory
                width: double.infinity,  // Take up full width
                height: 250,  // Fixed height
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
