import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/core/model/user_model.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/authentication.service.dart';

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
      Map<String, dynamic> _payload = {
        "matric": matricCtrl.text.trim(),
        "password": passwordCtrl.text.trim(),
      };
      showCustomLoading(title: 'Authenticating...');
      final result = await AuthenticationService.login(_payload);
      hideLoading();
      if (result.hasError) {
        notifyError(content: result.message);
      } else {
        final _auth = locator<AuthUser>();
        _auth.updateAuthUser(
            UserModel.fromJson(result.data['user']), result.data['token']);
        _auth.authUser.isAdmin!
            ? Get.offAllNamed('/adminDashboard')
            : Get.offNamedUntil('/dashboard', (route) => false);
      }
    }
  }
}
