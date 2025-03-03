import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropDown(),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  // initial selected value by default
  String dropdownValue = 'Item 1';

  //list of items that will be dropped down in the menu when the user clicks the icon
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              //i will show the initial value
                value: dropdownValue,
              //design a down arrows for the user to click to see the menu items
                icon: Icon(Icons.keyboard_arrow_down),
              //list of items in the menu
              //map transforms the string object is DropdownMenuItem object
                items: items.map((String items){
                  return DropdownMenuItem(
                    value: items,
                  child: Text(items)
                  );
                }).toList(), // i want to make the list iterable by calling toList method
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
