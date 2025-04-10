import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAMt9v2cfHa2PbvTYpxgOdgQlP6TzZ6lUw",
      appId: "178890016719",
      messagingSenderId: "178890016719",
      projectId: "class17demo",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductManagement(),
    );
  }
}

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('Users');
  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection('Products');

  String productName = '';
  double productPrice = 0.0;
  String ownerId = '';

  Future<void> addProduct() async {
    if (productName.isNotEmpty && productPrice > 0 && ownerId.isNotEmpty) {
      try {
        // Verify ownerId exists in the Users collection
        DocumentSnapshot userDoc = await usersCollection.doc(ownerId).get();
        if (userDoc.exists) {
          await productsCollection.add({
            'name': productName,
            'price': productPrice,
            'ownerId': ownerId,
          });
          print('Product added');
          setState(() {
            productName = '';
            productPrice = 0.0;
            ownerId = '';
          });
        } else {
          print('Invalid ownerId: User does not exist.');
        }
      } catch (error) {
        print('Failed to add product: $error');
      }
    } else {
      print('Enter valid product details and ownerId.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    productName = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    productPrice = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    ownerId = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Owner ID (userId)'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: addProduct,
                child: Text('Add Product'),
              ),
              StreamBuilder(
                stream: productsCollection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['name']),
                        subtitle: Text(
                            'Price: ${data['price']} | Owner ID: ${data['ownerId']}'),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
