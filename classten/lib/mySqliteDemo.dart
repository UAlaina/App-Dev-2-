import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  //write a map function to manipulate the data on the table

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Database database = await getDatabase();

  Future<Database> getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE dog (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1
    );
  }

  Future<void> insert(Dog dog, Database db) async{
    await db.insert('dog',
    dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs (Database db) async {
    final List<Map<String, Object?>> dogMaps = await db.query('dog');
    return dogMaps.map((dogMap) {
      return Dog(
        id: dogMap['id'] as int,
        name: dogMap['name'] as String,
        age: dogMap['age'] as int,
      );
    }).toList();
  }
  //create a dog object and add into the table

  var fido = Dog(
    id: 0,
    name: 'fefe',
    age: 15,
  );

  await insert(fido, database);

  //now, use the method to retrieve all th dog object
  print(await dogs(database)); // print a list that also includes fido object

  //update fido age and save it to the database
  fido = Dog(
      id: fido.id,
      name: fido.name,
      age: fido.age + 3
  );

  Future<void> updateDog (Dog dog, Database db) async{
    await db.update('dog', dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id, Database db) async {
    await db.delete('dog', where: 'id = ?', whereArgs: [id]);
  }

  await updateDog(fido, database);
  print(await dogs(database)); // print a updated list that also includes fido object

  //delete fido from the database
  await deleteDog(fido.id, database);
  print(await dogs(database));
}