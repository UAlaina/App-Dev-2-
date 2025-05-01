import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDq-NUzzUAbgtobOh5Mg1zVrHm_9u0XEXo",
      appId: "90529014068",
      messagingSenderId: "90529014068",
      projectId: "lastclass-918bd",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Email Verification',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _status = '';

  Future<void> registerAndSendVerification() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        setState(() {
          _status = 'Verification email sent to ${user.email}. Please check your inbox.';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    }
  }

  Future<void> checkEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Refresh user
    user = _auth.currentUser;

    if (user != null && user.emailVerified) {
      setState(() {
        _status = '✅ Email is verified!';
      });
    } else {
      setState(() {
        _status = '❌ Email not verified yet.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: registerAndSendVerification, child: Text('Register & Send Verification')),
            ElevatedButton(onPressed: checkEmailVerified, child: Text('Check Email Verification')),
            SizedBox(height: 20),
            Text(_status, style: TextStyle(fontSize: 16, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}