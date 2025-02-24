//import 'dart:ffi';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: _buildImageColumn(),
        //child: _buildGrid(),
        //child: _buildList(),
        //child: _buildStack(),
        child: _buildCard(),
      ),
    );
  }

  _buildImageColumn() {
    return Container(
      child: Column(
          children: [
            _buildImageRow(1),
            _buildImageRow(3),
          ]
      ),
    );

  }

  //you can use arrow function here
  _buildImageRow(int i) =>
      Row(
          children: [
            _buildDecoratedImage(i),
            _buildDecoratedImage(i + 1),
          ]
      );

  _buildDecoratedImage(int i) => Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.pink),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      margin: EdgeInsets.all(6),
      child: Image.asset("assets/pic${i}.jpg"),
    ),
  );

  _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(6),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(7),
  );

  _buildGridTileList(int i) =>
      List.generate(i, (j) => Image.asset("assets/pic${i}.jpg"));

  _buildList() {
    return ListView(
      children: [
        _tile("Hollywood moviess", "343 laval quebec", Icons.theaters_outlined),
        _tile("Hollywood moviess", "343 laval quebec", Icons.theaters),
        _tile("Hollywood moviess", "343 laval quebec", Icons.theater_comedy),
        _tile("Hollywood moviess", "343 laval quebec", Icons.theaters_sharp),
      ],
    );
  }

  _tile(String s, String t, IconData theater){
    return ListTile(
      title: Text(
        s,
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25
        ),
      ),
      subtitle: Text(t),
      leading: Icon(theater, color: Colors.purpleAccent,),
    );
  }

  _buildStack() {
    return Stack(
      alignment: Alignment(0.6,0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/pic1.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12
          ),
          child: Text(
            'majesty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }

  _buildCard(){
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
                title: Text(
                    'I am invincible',
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
              subtitle: Text('cos it is me'),
              leading: Icon(Icons.restaurant, color: Colors.redAccent),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Winter is not yet over',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              trailing: Icon(Icons.snowboarding, color: Colors.greenAccent),
            )
          ],
        ),
      ),
    );
  }
}
