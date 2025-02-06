import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroundStreet(),
    );
  }
}

class GroundStreet extends StatelessWidget {
  const GroundStreet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oseschinen Lake Campgrround'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
        children:[
            Image.asset('assets/lake.jpg', fit: BoxFit.cover, width: double.infinity, height: 200,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Oseschinen Lake Campground",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kandersteg,Switzerland",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 10),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  "41",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.call,),
            ],
          )
        ],
        ),
    ),
    );
  }
}

