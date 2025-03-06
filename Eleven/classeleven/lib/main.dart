import 'dart:async';
import 'package:classeleven/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: DogListDemo());
  }
}

class DogListDemo extends StatefulWidget {
  const DogListDemo({super.key});

  @override
  State<DogListDemo> createState() => _DogListDemoState();
}

class _DogListDemoState extends State<DogListDemo> {
  late Database database;
  List<Dog> dogsList = [];

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //we have to call a method InitState that initialize the database to bind the app
  // i want to bind the database for the widgets to interact with the data

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    database =
        await openDatabase(join(await getDatabasesPath(), 'widgetdogdb.db'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    }, version: 1);
    _refreshDogList();
  }

  Future<void> _refreshDogList() async {
    final List<Map<String, Object?>> dogMaps = await database.query('dogs');
    setState(() {
      dogsList = dogMaps.map((dogMap) {
        return Dog(
          id: dogMap['id'] as int,
          name: dogMap['name'] as String,
          age: dogMap['age'] as int,
        );
      }).toList();
    });
  }
  
  //add the value to the textfield
  Future<void> _addData() async {
    final int id = int.tryParse(idController.text) ?? 0;
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;
    if(name.isNotEmpty && age > 0) {
      database.insert('dogs', {'id' : id, 'name' : name, 'age' : age},
        conflictAlgorithm: ConflictAlgorithm.replace);
      _refreshDogList();
      _clearFields();
    }
  }

  void _clearFields() {
    idController.clear();
    nameController.clear();
    ageController.clear();
  }

  //update dog
  Future<void> _updateDog() async{
    final int id = int.tryParse(idController.text) ?? 0;
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;

    if(id > 0 && name.isNotEmpty && age > 0) {
      database.update('dog', {'id' : id, 'name' : name, 'age' : age},
          where: 'id = ?', whereArgs: [id]);
      _refreshDogList();
      _clearFields();
    }
  }

  //delete a dog by id
  Future<void> _deleteDog() async{
    final int id = int.tryParse(idController.text) ?? 0;
    if(id > 0){
      database.delete('dog', whereArgs: [id], where: 'id = ?');
      _refreshDogList();
      _clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Enter id',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter name'
              ),
            ),
            SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _addData, child: Text('add')),
                  ElevatedButton(onPressed: _updateDog, child: Text('update')),
                  ElevatedButton(onPressed: _deleteDog, child: Text('delete')),
                ],
              ),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                  itemCount: dogsList.length,
                    itemBuilder: (context, index) {
                    final dog =dogsList[index];
                    return ListTile(
                      title: Text('${dog.name} (Age " ${dog.age}'),
                      subtitle: Text('ID : ${dog.id}'),
                    );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}
