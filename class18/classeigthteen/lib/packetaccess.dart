import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneCallDemo(),
    );
  }
}

class PhoneCallDemo extends StatefulWidget {
  const PhoneCallDemo({super.key});

  @override
  State<PhoneCallDemo> createState() => _PhoneCallDemoState();
}

class _PhoneCallDemoState extends State<PhoneCallDemo> {

  //initialize the phone library
  Future<void> _makePhoneCall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: '4384145269');
    if(await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'could not call $phoneUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone access demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get me the access'
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _makePhoneCall,
                  child: Text('CALL')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
