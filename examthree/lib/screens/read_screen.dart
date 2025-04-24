import 'package:flutter/material.dart';
import 'package:examthree/services/firestore_service.dart';


class ReadScreen extends StatelessWidget {
  final _phoneController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Entry"),
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
              final entry = await _firestoreService.readEntry(_phoneController.text);
              if(entry != null) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(title: Text('Entry Found woohoo'),
                      content: Text('Name : ${entry['name']} \n'
                      'Operator : ${entry['operator']} \n'
                      'Location : ${entry['location']}'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                        ),
                      ],
                    )
                );
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Nothing like that here')),
                );
              }
            }, child: Text('Search')
            ),
          ],
        ),
      ),
    );
  }
}
