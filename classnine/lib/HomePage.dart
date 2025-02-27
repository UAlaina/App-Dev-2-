import 'package:flutter/material.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

//im going to send multiple objects from first to second
//if i use generics, it can't be different objects

class MyHomePage extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  List<String> datalist = [];
  //const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is me, Home'),
            SizedBox(height: 10),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter some data',
              ),
            ),
            SizedBox(height: 20),
            //this method is used to add multiple string object
            //from the user to the list list container
            ElevatedButton(
                onPressed: () {
                  datalist.add(_textEditingController.text);
                  _textEditingController.clear();
                },
                child: Text('Add to container')
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //Navigator helps me to connect source and destination
                  //here source is the context
                  //destination is the one route/ page that i want to connect
                  //from the source
                  //materialPage route is used for transition from src to des
                  //material page route(MRP) builds a new context in this case, a second page
                  Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: datalist
                  );
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SecondPage(data: datalist)));
                },
                child: Text('Click to go Second')
            ),
          ],
        ),
      ),
    );
  }
}