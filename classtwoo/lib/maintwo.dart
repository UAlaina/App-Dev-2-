import 'package:flutter/material.dart';

void main() {
  runApp(MySecondApp());
}

class MySecondApp extends StatelessWidget {
  const MySecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCounterDemo(),
    );
  }
}

class MyCounterDemo extends StatelessWidget {
  const MyCounterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome', style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Text('To flutter', style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Icon(
              Icons.beach_access,
              color: Colors.amber,
              size: 30,
            ),
        SizedBox(height: 10,),
        Icon(
          Icons.audiotrack,
          color: Colors.green,
          size: 30,
        ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: 200,
              color: Colors.deepOrangeAccent,
              alignment: Alignment.center,
              child: Text('Container'),
            ),
            SizedBox(height: 20,),
            Container(
              child: Image(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs35h--nMMVkNfv3Q9JYOUxDR6xHMfAdD9Og&s'
                ''),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {},
                child: Text(' + ',)),
            SizedBox(height: 10,),
            Text('0'),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {},
                child: Text(' - ',)),
          ],
        ),
      ),
    );
  }
}

