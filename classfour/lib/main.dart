import 'package:flutter/material.dart';

void main() {
  runApp(StatefulDemo());
}

class StatefulDemo extends StatelessWidget {
  const StatefulDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySatefulProject(),
    );
  }
}

class MySatefulProject extends StatefulWidget {
  const MySatefulProject({super.key});

  //this state represents the present state of the widget
  @override
  State<MySatefulProject> createState() => _MySatefulProjectState();
}

//this class will re render/ re draw the reaction
//based upon the user action that enable
//in the setstate method
class _MySatefulProjectState extends State<MySatefulProject> {

  //variable that counts the click
  int _count = 10;

  //methods to increment and decrement
  void increment() {
    //this setState method will listen the user action
    //and helps to re render my new widget desgin
    setState(() {
      _count++;
    });
  }

  void decrement() {
    //this setState method will listen the user action
    //and helps to re render my new widget desgin
    setState(() {
      _count--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Counter Demo'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                  onPressed: increment,
                  child: Text('+')),
              SizedBox(height: 10,),
              Text('${_count}'),
              ElevatedButton(
                  onPressed: decrement,
                  child: Text('-')),
            ],
        ),
      ),
    );
  }
}

