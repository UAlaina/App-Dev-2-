import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'user_database_helper.dart';

void main() async {
  sqfliteFfiInit();
  //databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UserManagementApp());
}

class UserManagementApp extends StatelessWidget {
  const UserManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserManagement(),
    );
  }
}

class UserManagement extends StatefulWidget {
  const UserManagement({super.key});

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  final UserDBHelper dbHelper = UserDBHelper();
  List<User> users = [];

  final nameController = TextEditingController();
  final contactPhoneController = TextEditingController();
  final ssnController = TextEditingController();
  final addressController = TextEditingController();

  bool isUpdating = false;
  int? currentUserId;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  void dispose() {
    nameController.dispose();
    contactPhoneController.dispose();
    ssnController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void clear() {
    isUpdating = false;
    currentUserId = null;
    nameController.clear();
    contactPhoneController.clear();
    ssnController.clear();
    addressController.clear();
  }

  Future<void> _loadUsers() async {
    try {
      final loadedUsers = await dbHelper.getUsers();
      setState(() {
        users = loadedUsers;
      });
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  Future<void> _addUser() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name cannot be empty')),
      );
      return;
    }

    final user = User(
      id: 0,
      name: nameController.text,
      contactPhone: contactPhoneController.text,
      ssn: ssnController.text,
      address: addressController.text,
    );

    try {
      await dbHelper.insertUser(user);
      clear();
      await _loadUsers();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add user: $e')),
      );
    }
  }

  Future<void> _deleteUser(int id) async {
    try {
      await dbHelper.deleteUser(id);
      await _loadUsers();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user: $e')),
      );
    }
  }

  Future<void> _updateUser() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name cannot be empty')),
      );
      return;
    }

    final user = User(
      id: currentUserId!,
      name: nameController.text,
      contactPhone: contactPhoneController.text,
      ssn: ssnController.text,
      address: addressController.text,
    );

    try {
      await dbHelper.updateUser(user);
      clear();
      await _loadUsers();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user: $e')),
      );
    }
  }

  void displayCurrentUpdating(User user) {
    setState(() {
      isUpdating = true;
      currentUserId = user.id;
      nameController.text = user.name;
      contactPhoneController.text = user.contactPhone;
      ssnController.text = user.ssn;
      addressController.text = user.address;
    });
  }

  void _submit() {
    if (isUpdating) {
      _updateUser();
    } else {
      _addUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdating ? 'Update User' : 'User Management'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: contactPhoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: ssnController,
                    decoration: InputDecoration(
                      labelText: 'SSN',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: _submit,
              child: Text(isUpdating ? 'Update' : 'Add User'),
            ),

            // List of users
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(user.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('SSN: ${user.ssn}'),
                                  Text('Phone: ${user.contactPhone}'),
                                  Text('Address: ${user.address}'),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.green),
                                onPressed: () {
                                  displayCurrentUpdating(user);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteUser(user.id),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
