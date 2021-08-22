import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/authentication.service.dart';

class AccountController extends GetxController {
  String _contactUsNumber = '07061101691';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPwdCtrl = TextEditingController();
  TextEditingController cPwdCtrl = TextEditingController();

  final AuthUser auth = locator<AuthUser>();
  void onTalkToUs() async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(_contactUsNumber);
    print('debug dialer response: $res'); //remove later
    if (res == null || !res) {
      Get.snackbar(
        'Error!',
        'Unable to open your phone dialer',
        backgroundColor: black,
        colorText: white,
      );
    }
  }

  Future<void> changePassword() async {
    final _uid = locator<AuthUser>().authUser.id;
    print('hey');
    if (newPwdCtrl.text.length < 6 ||
        cPwdCtrl.text.length < 6 ||
        (newPwdCtrl.text != cPwdCtrl.text)) {
      notifyError(content: 'Password mismatch, empty fields or short password');
    } else {
      Map<String, dynamic> _payload = {
        "confirmPassword": cPwdCtrl.text,
        "newPassword": newPwdCtrl.text,
      };
      print(_payload.toString());

      showCustomLoading(title: 'Updating password');
      final result =
          await AuthenticationService.changePassword(_payload, _uid!);
      hideLoading();
      if (result.hasError) {
        notifyError(content: result.message);
      } else {
        notifySuccess(content: result.message);
        Get.back();
      }
    }
  }

  logout() async {
    showCustomLoading(title: 'Logging Out...');
    await Future.delayed(Duration(seconds: 4));
    hideLoading();
    Get.offAllNamed('/login');
  }
}
