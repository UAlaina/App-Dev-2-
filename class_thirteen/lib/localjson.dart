import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLocalJsonData(),
    );
  }
}

class MyLocalJsonData extends StatefulWidget {
  const MyLocalJsonData({super.key});

  @override
  State<MyLocalJsonData> createState() => _MyLocalJsonDataState();
}

class _MyLocalJsonDataState extends State<MyLocalJsonData> {
  List _item = [];

  //fetch the local json content which comes from sample.json file
  Future<void> readJson() async {
    final String response =
    //rootbundle is the service that allows to fetch the asset resource
    await rootBundle.loadString('assets/sample.json');
    final data = await jsonDecode(response);
    setState(() {
      _item = data["items"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: readJson,
                child: Text('Load Json')),

            _item.isNotEmpty ? Expanded(
                child: ListView.builder(
                  itemCount: _item.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Text(_item[index]["id"]),
                        title: Text(_item[index]["name"]),
                        subtitle: Text(_item[index]["Description"]),
                    ),
                  );
                },
                ),
            ) : Container(
              //since i am using Expanded, i have to make it as container object
            )
          ],
        ),
      ),
    );
  }
}
