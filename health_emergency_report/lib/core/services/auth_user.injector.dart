import 'package:flutter/material.dart';
import 'package:health_emergency_report/core/model/user_model.dart';

class AuthUser extends ChangeNotifier {
  late UserModel _authUser;
  UserModel get authUser => _authUser;
  String? _token;
  String get token => _token!;
  void updateAuthUser(UserModel user, String token) {
    _authUser = user;
    _token = token;
    notifyListeners();
  }
}
