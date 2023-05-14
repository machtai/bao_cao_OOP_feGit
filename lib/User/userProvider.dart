// import 'package:flutter/material.dart';
// import 'package:smart_food/User/userModal.dart';

// class UserProvider with ChangeNotifier {
//   UserModel? _user;

//   UserModel? get user => _user;

//   void setUser(UserModel user) {
//     _user = user;
//     notifyListeners();
//   }

//   void clearUser() {
//     _user = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:smart_food/User/userModal.dart';

class UserProvider with ChangeNotifier {
  late String _accessToken;
  late String _refreshToken;

  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;

  setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    notifyListeners();
  }
    UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
