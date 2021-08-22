import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/app/screens/dashboard/dashboard.controller.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/authentication.service.dart';

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
      Map<String, dynamic> _payload = {
        "fullName": fullNameCtrl.text.trim(),
        "matric": matricCtrl.text.trim().toUpperCase(),
        "phone": countryCode + phoneCtrl.text.trim(),
        "hostel": hostelCtrl.text.trim(),
        "password": passwordCtrl.text.trim(),
      };

      showCustomLoading(title: 'Authenticating...');
      final result = await AuthenticationService.register(_payload);
      hideLoading();
      if (result.hasError) {
        notifyError(content: result.message);
      } else {
        Get.offNamedUntil('/login', (route) => false);
      }
    }
  }
}
