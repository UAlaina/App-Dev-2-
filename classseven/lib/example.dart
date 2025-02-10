import 'package:flutter/material.dart';


void main() {
  runApp(Layout());
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLayoutDemo(),
    );
  }
}

class MyLayoutDemo extends StatelessWidget {
  const MyLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyDesignLayout(),
    );
  }
}

class MyDesignLayout extends StatelessWidget {
  const MyDesignLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Main Axis Alignment ', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildContainers(),
            ),
            SizedBox(height: 20,),
            Text('Cross Axis Alignment ',style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold), ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 20,height: 50,color: Colors.red,),
                Container(width: 20,height: 50,color: Colors.green,),
                Container(width: 20,height: 50,color: Colors.blue,),
              ],
            ),
            SizedBox(height: 20,),
            Text('Expanded demo',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
            Row(
              children: [
                Expanded(child: Container(height: 50,color: Colors.red,)),
                Expanded(child: Container(height: 50,color: Colors.green,)),
                Expanded(child: Container(height: 50,color: Colors.blue,)),
              ],
            ),
            SizedBox(height: 20,),
            Text('MainAxis Size',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _buildContainers(),
            ),

            SizedBox(height: 20,),
            Text('MainAxis Alignment',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildContainers(),
            ),

            SizedBox(height: 20,),
            Text('CrossAxisAlignment',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Container(width: 20,height: 50,color: Colors.red,),
                    Container(width: 20,height: 50,color: Colors.green,),
                    Container(width: 20,height: 50,color: Colors.blue,),
                  ],
                ),
              ],
            ),


            SizedBox(height: 20,),
            Text('Expanded Column',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(child: Container(width: 50,color: Colors.red,)),
                  Expanded(child: Container(width: 50,color: Colors.green,)),
                  Expanded(child: Container(width: 50,color: Colors.blue,)),
                ],
              ),

            ),

            SizedBox(height: 20,),
            Text('Padding Column',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: _buildContainers(),
              ),),

            SizedBox(height: 20,),
            Text('Margin ROW',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),

            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 20),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }

  _buildContainers() {
    return [
      Container(width: 20,height: 50,color: Colors.red,),
      Container(width: 20,height: 50,color: Colors.green,),
      Container(width: 20,height: 50,color: Colors.blue,),
    ];
  }
}