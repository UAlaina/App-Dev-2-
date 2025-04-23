import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a book',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (_searchQuery.isEmpty || 'twisted game'.contains(_searchQuery.toLowerCase()))
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/twisted_game.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Twisted Game',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  '\$12.99',
                                  style: TextStyle(fontSize: 16, color: Colors.green[700])
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_searchQuery.isEmpty || 'twisted hate'.contains(_searchQuery.toLowerCase()))
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/twisted_hate.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Twisted Hate',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  '\$14.99',
                                  style: TextStyle(fontSize: 16, color: Colors.green[700])
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_searchQuery.isEmpty || 'twisted lies'.contains(_searchQuery.toLowerCase()))
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/twisted_lies.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Twisted Lies',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  '\$11.99',
                                  style: TextStyle(fontSize: 16, color: Colors.green[700])
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_searchQuery.isEmpty || 'twisted love'.contains(_searchQuery.toLowerCase()))
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/twisted_love.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Twisted Love',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  '\$13.99',
                                  style: TextStyle(fontSize: 16, color: Colors.green[700])
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}