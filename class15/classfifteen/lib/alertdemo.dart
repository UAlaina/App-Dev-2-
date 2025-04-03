import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAlertDemo(),
    );
  }
}

class MyAlertDemo extends StatefulWidget {
  const MyAlertDemo({super.key});

  @override
  State<MyAlertDemo> createState() => _MyAlertDemoState();
}

class _MyAlertDemoState extends State<MyAlertDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Here is your Alert Container'),
            ElevatedButton(
                onPressed: () => _showDialog(),
                child: Text('Confirm')
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      //user must tap the button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CRA file access'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text('This is to inform you that you have been warned not to buy crypto'),
                Text('Would you like this comment')
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              print('Confirm');
              Navigator.of(context).pop();
            },
                child: Text('Not Confirm')
            ),
          ],
        );
      }
    );
  }
}
