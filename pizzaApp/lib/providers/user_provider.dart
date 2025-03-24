import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  String _currentUser = '';

  String get currentUser => _currentUser;

  Future<bool> registerUser(String userId, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userExists = prefs.getString(userId) != null;
      if (userExists) {
        return false;
      }

      final user = User(userId: userId, password: password);
      await prefs.setString(userId, jsonEncode(user.toMap()));
      return true;
    } catch (e) {
      print('Error registering user: $e');
      return false;
    }
  }

  Future<bool> loginUser(String userId, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserJson = prefs.getString(userId);

      if (storedUserJson == null) {
        return false;
      }

      final storedUser = User.fromMap(jsonDecode(storedUserJson));

      if (storedUser.password == password) {
        _currentUser = userId;
        notifyListeners();
        return true;
      }

      return false;
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }
}