import 'package:flutter/material.dart';
import 'package:examthree/services/firestore_service.dart';

class DeleteScreen extends StatelessWidget {
  final _phoneController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone number here'
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              final doc = await _firestoreService.readEntry(_phoneController.text);
              if (doc != null) {
                await _firestoreService.deleteEntry(doc.id);
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                    SnackBar(
                        content: Text('Entry deleted success,are you happy now?')
                    ),
                );
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                      content: Text('You idiot there is no number like that')
                  ),
                );
              }
            },
                child: Text('Delete'))
          ],
        ),
      ),
    );
  }
}
