
import 'package:examtwo/databaseHelper.dart';
import 'package:examtwo/user_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Flutter Appy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshUsersList();
  }

  Future<void> _refreshUsersList() async {
    final users = await DatabaseHelper.instance.getAllUsers();
    setState(() {
      _users = users;
    });
  }

  void _showUserDialog({User? user}) {
    final nameController = TextEditingController(text:user?.name ??"");
    final phoneController = TextEditingController(text:user?.phone ??"");
    final emailController = TextEditingController(text:user?.email ??"");

    showDialog(
      context: this.context,
      builder: (context) => AlertDialog(
        title:
        Text(
          user == null ? 'Create User': 'Edit User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Contact Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final newUser = User(
                  id: user?.id,
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text
              );
              if (user == null) {
                await DatabaseHelper.instance.createUser(newUser);
              } else {
                await DatabaseHelper.instance.updateUser(newUser);
              }
              _refreshUsersList();
              Navigator.of(context).pop();
            },
            child: Text(user == null ? 'Create' : 'createUser'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index){
            final user = _users[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0]),
              ),
              title: Text(user.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.phone),
                  Text(user.email),
                ],
              ),
              trailing:Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: () => _showUserDialog(user: user),),
                  IconButton(icon: Icon(Icons.delete), onPressed: () async {
                    await DatabaseHelper.instance.deleteUser(user.id!);
                    _refreshUsersList();
                  },
                  ),
                ],
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _showUserDialog(), child: Icon(Icons.add),
      ),
    );


  }
}

