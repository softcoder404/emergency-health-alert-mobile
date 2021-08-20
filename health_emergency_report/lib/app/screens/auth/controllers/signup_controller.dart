import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController matricCtrl = TextEditingController();
  TextEditingController hostelCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  FocusNode fullNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode matricNode = FocusNode();
  FocusNode hostelNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  String _countryCode = "+234";
  String get countryCode => _countryCode;
  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    update();
  }

  void onCountryCodeChange(String code) => _countryCode = code;
  void handleOnSignup() async {
    if (formKey.currentState!.validate()) {
      Get.offNamedUntil('/dashboard', (route) => false);
    }
  }
}
