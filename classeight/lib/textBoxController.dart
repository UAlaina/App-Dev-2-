import 'package:flutter/material.dart';


void main() {
  runApp(Appsome());
}

class Appsome extends StatelessWidget {
  const Appsome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  int? sum;

  void calculateSum() {
    int num1 = int.tryParse(num1controller.text) ?? 0;
    int num2 = int.tryParse(num2controller.text) ?? 0;
    setState(() {
      sum = num1 + num2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum calculator'),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.cyanAccent,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter the first number'),
            ),
            TextField(
            controller: num2controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter the second number'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: calculateSum,
                child: Text('Sum the values')),
            SizedBox(height: 20,),
            Text(
              sum != null ? 'Sum : $sum' : 'Enter numbers and click the button',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        ],
        ),
      ),
    );
  }
}

