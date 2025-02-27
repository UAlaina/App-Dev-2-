import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  //final String data;
  //final List<String> data;

  //SecondPage({required this.data});
  //const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> data = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is me, Second'),
            SizedBox(height: 20),
            Text(
              'Data from the first: $data',
              style: TextStyle(fontSize: 18)
            ),
            SizedBox(height: 20),
            //i will create a listview builder that creates multiple list tiles to display the objects
            //based upon the index i.e 0,1 ,2 ,etc

            Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                      title: Text(data[index]),
                    );
                    })),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Click me to go Home')
            ),
            // SizedBox(height: 20),
            // Text(data),
          ],
        ),
      ),
    );
  }
}