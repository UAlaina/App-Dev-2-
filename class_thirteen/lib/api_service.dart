import 'dart:math';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'constants.dart';
import 'user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndPoint);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    }catch(e) {
      //log(e.toString() as num);
      print(e);
    }
  }
}