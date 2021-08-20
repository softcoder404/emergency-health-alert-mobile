import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController matricCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  FocusNode matricNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  
  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    update();
  }

  void handleOnSubmit() async {
    if (formKey.currentState!.validate()) {
      Get.offNamedUntil('/dashboard', (route) => false);
    }
  }
}
