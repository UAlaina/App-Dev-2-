import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('To-Do List'),
              onTap: () {
                Navigator.pushNamed(context, '/todo');
              },
            ),
            ListTile(
              title: Text('BMI Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
            ListTile(
              title: Text('Quiz'),
              onTap: () {
                Navigator.pushNamed(context, '/quiz');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Dashboard!', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/todo'),
              child: Text('Go to To-Do List'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/bmi'),
              child: Text('Go to BMI Calculator'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/quiz'),
              child: Text('Go to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}