import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database
  final Database database = await getDatabase();

  // Create a Dog and add it to the database
  //multiple dogs
  List<Dog> dogsList = [
    Dog(id: 0, name: 'prpr', age: 35),
    Dog(id: 1, name: 'pupu', age: 34),
    Dog(id: 2, name: 'yuyu', age: 33),
    Dog(id: 3, name: 'jeje', age: 32)
  ];

  await insertDog(dogsList, database);

  print(await getDogs(database)); // Should print Fido

  // Update Fido's age
  Dog updatepupu = new Dog(id: 2, name: 'pepe', age: 36);
  await updateDog(updatepupu, database);

  // Print updated data
  print(await getDogs(database)); // Should print Fido with updated age
  // Delete Fido from the database
  await deleteDog(1, database);

  // Print final list (should be empty)
  print(await getDogs(database));

}

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(),
        'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}

Future<void> insertDog(List<Dog> dogs, Database db) async {

  for(Dog dog in dogs) {
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<List<Dog>> getDogs(Database db) async {
  final List<Map<String, Object?>> dogMaps = await db.query('dogs');
  return dogMaps.map((dogMap) {
    return Dog(
      id: dogMap['id'] as int,
      name: dogMap['name'] as String,
      age: dogMap['age'] as int,
    );
  }).toList();
}

Future<void> updateDog(Dog dog, Database db) async {
  await db.update(
    'dogs',
    dog.toMap(),
    where: 'id = ?',
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id, Database db) async {
  await db.delete(
    'dogs',
    where: 'id = ?',
    whereArgs: [id],
  );
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}