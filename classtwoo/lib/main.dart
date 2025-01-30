import 'package:flutter/material.dart';


void main(){
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //MaterialApp gets me the access
      //of complete Material(real emulator)
      home: MyFirstDemo(),
    );
  }
}

class MyFirstDemo extends StatelessWidget {
  const MyFirstDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold gets me space bar
      appBar: AppBar(
        title: Text('KOKO, KOKOKOKOKOKOKOKOKOKOKOKOKOKOKO'),
        backgroundColor: Colors.purple,
      ),
    //the remaining space is called body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Hamster.jpg', height:200, width: 200,),
            Text('I am KOKO no.1?',
            style: TextStyle(fontSize: 36),),
            Text('I am KOKO no.2?'),
            SizedBox(height: 20,),
            Text('I am KOKO no.3?'),
            Text('I am KOKO no.4?'),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  //call the in-build function to toast a message
                  //it is called ScaffoldMessenger
                  ScaffoldMessenger.of(context).
                  showSnackBar(SnackBar(content: Text('My name is....KO...KO..KOKO-MIAMI'),
                  duration: Duration(seconds: 3),));
                },
                child: Text("KOKO MEEE!!!!"))
          ],
        )
      ),
    );
  }
}
