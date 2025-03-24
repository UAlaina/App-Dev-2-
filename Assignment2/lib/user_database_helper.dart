import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int id;
  final String name;
  final String contactPhone;
  final String ssn;
  final String address;

  const User({required this.id, required this.name, required this.contactPhone, required this.ssn, required this.address});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'contactPhone': contactPhone, 'ssn': ssn, 'address': address};
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, contactPhone: $contactPhone, ssn: $ssn, address: $address}';
  }
}

class UserDBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'user_db.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE user(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          contactPhone TEXT,
          ssn TEXT,
          address TEXT)
          ''',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'user',
      {
        'name': user.name,
        'contactPhone': user.contactPhone,
        'ssn': user.ssn,
        'address': user.address,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> query = await db.query('user');
    return List.generate(query.length, (i) {
      return User(
        id: query[i]['id'],
        name: query[i]['name'],
        contactPhone: query[i]['contactPhone'],
        ssn: query[i]['ssn'],
        address: query[i]['address'],
      );
    });
  }

  // Update a user's information
  Future<void> updateUser(User user) async {
    final db = await database;
    await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete a user from the database
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
