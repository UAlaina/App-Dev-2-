import 'package:flutter/material.dart';
import 'package:examthree/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _operatorController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  // Future<bool> isDuplicatePhoneNo(String uniqueNumber) async {
  //   QuerySnapshot query = await FirebaseFirestore.instance
  //       .collection('phonebook')
  //       .where('phoneNumber', isEqualTo: _phoneController)
  //       .get();
  //   return query.docs.isNotEmpty;
  // }
  //
  // static firebaseGetTheNumber(String name, String operator, String location, String phoneNumber) async {
  //   if (await isDuplicatePhoneNo(phoneNumber)) {
  //     // UniqueName is duplicate
  //     // return 'Unique name already exists';
  //   }

  CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              
              TextFormField(
                controller: _operatorController,
                decoration: InputDecoration(
                    labelText: 'Operator here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your operator' : null,
              ),
              
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                    labelText: 'Location here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your location' : null,
              ),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone number here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () async {
                if(_formKey.currentState!.validate()){
                  await _firestoreService.createEntry(
                      _nameController.text,
                      _operatorController.text,
                      _locationController.text,
                      _phoneController.text
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Entry created success yayyy'))
                  );
                }
              },
                  child: Text('Save')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
