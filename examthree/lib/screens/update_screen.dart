import 'package:flutter/material.dart';
import 'package:examthree/services/firestore_service.dart';

class UpdateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _operatorController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone number here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
              ),

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Name here'
                ),
                validator: (value) => value!.isEmpty ? 'Enter your Name' : null,
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

              SizedBox(height: 20),
              ElevatedButton(onPressed: () async {
                if(_formKey.currentState!.validate()){
                  final doc = await _firestoreService.readEntry(_phoneController.text);
                  if(doc != null) {
                    await _firestoreService.updateEntry(doc.id, {
                      'phoneNumber' : _phoneController.text,
                      'name' : _nameController.text,
                      'operator' : _operatorController.text,
                      'location' : _locationController.text,
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                            content: Text('Entry updated success yayyy, now get out')
                        ),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('pfffft couldn\'t do it')),
                    );
                  }
                }
              },
                  child: Text('Update')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
