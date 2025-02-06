import 'package:flutter/material.dart';

void main() {
  runApp(const Mydesign());
}

class Mydesign extends StatelessWidget {
  const Mydesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLakeView(),
    );
  }
}

class MyLakeView extends StatelessWidget {
  const MyLakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/lake.jpg',
            width: 400,
            height: 250,
            fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 8),
                        child: Text('Oeschinen Lake CampGround',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Kandersteg, Switzerland',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    ),
                    SizedBox(width: 18,child: Text('41'),
                      ),
                  ],
                ),
              ],
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.call,
                  color: Colors.blueAccent,
                  size: 25,
                ),
                Icon(
                  Icons.near_me,
                  color: Colors.blueAccent,
                  size: 25,
                ),
                Icon(
                  Icons.share,
                  color: Colors.blueAccent,
                  size: 25,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("CALL", style: TextStyle(fontSize:12, fontWeight: FontWeight.w400,color: Colors.blueAccent),),
                Text("ROUTE", style: TextStyle(fontSize:12, fontWeight: FontWeight.w400,color: Colors.blueAccent),),
                Text("SHARE", style: TextStyle(fontSize:12, fontWeight: FontWeight.w400,color: Colors.blueAccent),),
              ],
            ),
            Padding(padding: EdgeInsets.all(32),
            child: Text(
              'Oeschinen Lake (Oeschinensee), located near the village of Kandersteg in Switzerland, is a breathtaking alpine lake known for its stunning turquoise waters and dramatic mountain scenery. Surrounded by the towering peaks of the Bernese Oberland, it offers visitors a variety of outdoor activities, including hiking, boating, and swimming. The area is a hiker\'s paradise, with trails that offer spectacular views of the lake and its alpine surroundings.'
            'Though camping directly at the lake is not allowed, there are nearby campsites, such as Camping Rendez-Vous, which is just a 15-minute walk from the lake. This site offers panoramic mountain views and modern facilities. To access the lake, visitors can take a scenic cable car ride from Kandersteg. During the summer, you can rent boats to explore the lake or take a refreshing swim in its clear waters, making it a perfect destination for nature lovers and adventure seekers alike.',
              softWrap: true,
            ),)
          ],
        ),
      ),
    );
  }
}


