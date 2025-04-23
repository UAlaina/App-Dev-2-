import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Make sure to add intl package to your pubspec.yaml

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _taskController = TextEditingController();
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  String? _editingTaskId;

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      if (_editingTaskId != null) {
        // Update existing task
        tasks.doc(_editingTaskId).update({
          'task': _taskController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _editingTaskId = null;
      } else {
        // Add new task
        tasks.add({
          'task': _taskController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
      _taskController.clear();
    }
  }

  void _editTask(String taskId, String taskText) {
    setState(() {
      _editingTaskId = taskId;
      _taskController.text = taskText;
    });
    // Focus on the text field
    FocusScope.of(context).requestFocus(FocusNode());
  }

  String _formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return 'Just now';

    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMM d, yyyy - h:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: tasks.orderBy('timestamp', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No tasks yet. Add some!'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data!.docs[index];
                    var task = doc['task'];
                    Timestamp? timestamp = doc['timestamp'] as Timestamp?;

                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          task,
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          'Created at: ${_formatTimestamp(timestamp)}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        onTap: () => _editTask(doc.id, task),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => doc.reference.delete(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: _editingTaskId != null ? 'Update task' : 'Add a new task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _addTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    _editingTaskId != null ? 'Update' : 'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}