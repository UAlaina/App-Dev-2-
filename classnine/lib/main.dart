import 'package:classnine/HomePage.dart';
import 'package:classnine/SecondPage.dart';
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
      //in the main we have to refer routes that specifies the path reference to multiple routes
      //mainly used to connect any pages to any screen
      routes: {
        '/' : (context) => MyHomePage(),
        '/second' : (context) => SecondPage(),
      },
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('This is me, Home'),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 onPressed: () {
//                   //Navigator helps me to connect source and destination
//                   //here source is the context
//                   //destination is the one route/ page that i want to connect
//                   //from the source
//                   //materialPage route is used for transition from src to des
//                   //material page route(MRP) builds a new context in this case, a second page
//                   Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SecondPage()));
//                 },
//                 child: Text('Click to go Second'))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second page'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('This is me, Second'),
//             SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Click me to go Home'))
//           ],
//         ),
//       ),
//     );
//   }
// }