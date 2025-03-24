import 'package:flutter/material.dart';
import 'user_model.dart';
import 'constants.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiData(),
    );
  }
}

class ApiData extends StatefulWidget {
  const ApiData({super.key});

  @override
  State<ApiData> createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  List<UserModel>? _usermodel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //the method mus be connected to the server and this app expects data streaming to the app
    _getData();
  }

  void _getData() async {
    _usermodel = (await ApiService().getUsers());
    Future.delayed(Duration(seconds: 1)). then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API Demo'),
      ),
      body: _usermodel == null || _usermodel!.isEmpty
          ? Center(
            child: CircularProgressIndicator(),
      ): 
      ListView.builder(
          itemCount: _usermodel!.length,
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_usermodel![index].id.toString()),
                      Text(_usermodel![index].username,)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_usermodel![index].id.toString()),
                      Text(_usermodel![index].username,)
                    ],
                  )
                ],
              ),
            );
      }),
    );
  }
}

