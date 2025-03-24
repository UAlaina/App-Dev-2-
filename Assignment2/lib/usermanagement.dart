//THIS THING IS NOT WORKING
























// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class User {
//   final int? id;
//   final String name;
//   final String phone;
//   final String ssn;
//   final String address;
//
//   const User({
//     this.id,
//     required this.name,
//     required this.phone,
//     required this.ssn,
//     required this.address,
//   });
//
//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'],
//       name: map['name'],
//       phone: map['phone'],
//       ssn: map['ssn'],
//       address: map['address'],
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'phone': phone,
//       'ssn': ssn,
//       'address': address,
//     };
//   }
// }
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;
//
//   DatabaseHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('user_database.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }
//
//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         phone TEXT NOT NULL,
//         ssn TEXT NOT NULL,
//         address TEXT NOT NULL
//       )
//     ''');
//   }
//
//   Future<int> insertUser(User user) async {
//     final db = await instance.database;
//     return await db.insert('users', user.toMap());
//   }
//
//   Future<List<User>> getAllUsers() async {
//     final db = await instance.database;
//     final List<Map<String, dynamic>> maps = await db.query('users');
//     return List.generate(maps.length, (i) => User.fromMap(maps[i]));
//   }
//
//   Future<int> updateUser(User user) async {
//     final db = await instance.database;
//     return await db.update(
//       'users',
//       user.toMap(),
//       where: 'id = ?',
//       whereArgs: [user.id],
//     );
//   }
//
//   Future<int> deleteUser(int id) async {
//     final db = await instance.database;
//     return await db.delete(
//       'users',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }
//
// final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   //databaseFactory = databaseFactoryFfi;
//   //await DatabaseHelper.instance.database;
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: _scaffoldMessengerKey,
//       debugShowCheckedModeBanner: false,
//       title: 'SQLite User Management',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//       ),
//       home: const UserManagementScreen(),
//     );
//   }
// }
//
// class UserManagementScreen extends StatefulWidget {
//   const UserManagementScreen({super.key});
//
//   @override
//   State<UserManagementScreen> createState() => _UserManagementScreenState();
// }
//
// class _UserManagementScreenState extends State<UserManagementScreen> {
//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final ssnController = TextEditingController();
//   final addressController = TextEditingController();
//
//   late Future<List<User>> futureUsers;
//   int? editingUserId;
//   bool isEditing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _refreshUsersList();
//   }
//
//   Future<void> _refreshUsersList() async {
//     setState(() {
//       futureUsers = DatabaseHelper.instance.getAllUsers();
//     });
//   }
//
//   void _resetForm() {
//     nameController.clear();
//     phoneController.clear();
//     ssnController.clear();
//     addressController.clear();
//     setState(() {
//       isEditing = false;
//       editingUserId = null;
//     });
//   }
//
//   void _showEditForm(User user) {
//     nameController.text = user.name;
//     phoneController.text = user.phone;
//     ssnController.text = user.ssn;
//     addressController.text = user.address;
//     setState(() {
//       isEditing = true;
//       editingUserId = user.id;
//     });
//   }
//
//   Future<void> _saveUser() async {
//     // Validate the input fields
//     if (nameController.text.isEmpty ||
//         phoneController.text.isEmpty ||
//         ssnController.text.isEmpty ||
//         addressController.text.isEmpty) {
//       // Use global key instead of context
//       _scaffoldMessengerKey.currentState?.showSnackBar(
//         const SnackBar(
//           content: Text('Please fill in all the fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     if (isEditing && editingUserId != null) {
//       await DatabaseHelper.instance.updateUser(
//         User(
//           id: editingUserId,
//           name: nameController.text,
//           phone: phoneController.text,
//           ssn: ssnController.text,
//           address: addressController.text,
//         ),
//       );
//       _scaffoldMessengerKey.currentState?.showSnackBar(
//         const SnackBar(content: Text('User updated successfully')),
//       );
//     } else {
//       await DatabaseHelper.instance.insertUser(
//         User(
//           name: nameController.text,
//           phone: phoneController.text,
//           ssn: ssnController.text,
//           address: addressController.text,
//         ),
//       );
//       _scaffoldMessengerKey.currentState?.showSnackBar(
//         const SnackBar(content: Text('User added successfully')),
//       );
//     }
//
//     _resetForm();
//     _refreshUsersList();
//   }
//
//   Future<void> _deleteUser(int id) async {
//     await DatabaseHelper.instance.deleteUser(id);
//     _scaffoldMessengerKey.currentState?.showSnackBar(
//       const SnackBar(content: Text('User deleted successfully')),
//     );
//     _refreshUsersList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Management'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(
//                 labelText: 'Contact Phone',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: ssnController,
//               decoration: const InputDecoration(
//                 labelText: 'SSN',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: addressController,
//               decoration: const InputDecoration(
//                 labelText: 'Address',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 2,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveUser,
//               child: Text(isEditing ? 'Update User' : 'Insert User'),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'User List',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: FutureBuilder<List<User>>(
//                 future: futureUsers,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final users = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: users.length,
//                       itemBuilder: (context, index) {
//                         final user = users[index];
//                         return Card(
//                           margin: const EdgeInsets.only(bottom: 10),
//                           child: ListTile(
//                             leading: const CircleAvatar(
//                               child: Icon(Icons.person),
//                             ),
//                             title: Text(user.name),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Phone: ${user.phone}'),
//                                 Text('SSN: ${user.ssn}'),
//                                 Text('Address: ${user.address}'),
//                               ],
//                             ),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.edit),
//                                   onPressed: () => _showEditForm(user),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () => _deleteUser(user.id!),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//
//                   // By default, show a loading spinner.
//                   return const Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     phoneController.dispose();
//     ssnController.dispose();
//     addressController.dispose();
//     super.dispose();
//   }
// }