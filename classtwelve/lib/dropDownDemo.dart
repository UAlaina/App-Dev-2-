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
      home: DropDownDemo(),
    );
  }
}

class DropDownDemo extends StatefulWidget {
  const DropDownDemo({super.key});

  @override
  State<DropDownDemo> createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String selectedValue = 'Option 1';
  List<String> dropDownItems = ['die?','death?','hell?', 'school?'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down Menu Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'selected Value',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedValue,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              value: selectedValue,
                items: dropDownItems.map((String item) {
                return DropdownMenuItem(
                    value: item,
                    child: Text(item));
                  }).toList(),
                onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
                }
            ),
          ],
        ),
      ),
    );
  }
}
