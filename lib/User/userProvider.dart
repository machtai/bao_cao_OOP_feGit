import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:smart_food/User/userModal.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> login(String phoneNumber, String password) async {
    final response = await http.post(
      Uri.parse('http://14.225.205.198:8989/auth/login'),
      body: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body)['user'];
      _user = UserModel.fromJson(userJson);
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }
}
