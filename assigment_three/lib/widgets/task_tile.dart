import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String task;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  TaskTile({required this.task, required this.onTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      onTap: onTap,
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}