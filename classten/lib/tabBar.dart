import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabViewBar(),
    );
  }
}

class TabViewBar extends StatefulWidget {
  const TabViewBar({super.key});

  @override
  State<TabViewBar> createState() => _TabViewBarState();
}

class _TabViewBarState extends State<TabViewBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.android),text: 'My Android',),
                Tab(icon: Icon(Icons.phone_iphone),text: 'My IPhone',),
              ],
            ),
            title: Text('My Tab View Demo'),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Go for Android'),),
              Center(child: Text('Go for Mac'),),
              ],
          ),
        )
    );
  }
}
