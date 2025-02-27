import 'package:flutter/material.dart';

void main() {
  runApp(papa());
}

class papa extends StatelessWidget {
  const papa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Firstpapa(),
    );
  }
}

class Firstpapa extends StatelessWidget {
  const Firstpapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First ever papa'),),
        body: Center(
          child: Text('Welcome, First Papa'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Secondpapa())
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class Secondpapa extends StatelessWidget {
  const Secondpapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second worst papa'),),
      body: Center(
        child: Text('Welcome, worst Papa'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Secondpapa())
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
