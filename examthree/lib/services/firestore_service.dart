import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService extends StatelessWidget {
  final CollectionReference phonebook = FirebaseFirestore.instance.collection('phonebook');
  FirestoreService({super.key});

  Future<void> createEntry(String name, String operator, String location, String phoneNumber) async {
    await phonebook.add({
      'name' : name,
      'operator' : operator,
      'location' : location,
      'phoneNumber' : phoneNumber,
    });
    //FirebaseFirestore.instance.collection('phonebook').where('phoneNumber', isEqualTo: 'phoneNumber').get();
  }

  Future<DocumentSnapshot?> readEntry (String phoneNumber) async {
    QuerySnapshot snapshot = await phonebook
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    return snapshot.docs.isNotEmpty ? snapshot.docs.first : null;
  }

  Future<void> updateEntry (String docId, Map<String, dynamic> updateData) async {
    await phonebook.doc(docId).update(updateData);
  }

  Future<void> deleteEntry (String docId) async {
    await phonebook.doc(docId).delete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Form'),
      ),
    );
  }
}
