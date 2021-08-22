import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/core/model/user_model.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/authentication.service.dart';

class EditAccountController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthUser _auth = locator<AuthUser>();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController matricCtrl = TextEditingController();
  TextEditingController hostelCtrl = TextEditingController();
  TextEditingController departmentCtrl = TextEditingController();
  TextEditingController levelCtrl = TextEditingController();

  FocusNode fullNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode matricNode = FocusNode();
  FocusNode hostelNode = FocusNode();
  FocusNode departmentNode = FocusNode();
  FocusNode levelNode = FocusNode();

  void handleOnSaveChange() async {
    final Map<String, dynamic> _payload = {
      "department": departmentCtrl.text.trim(),
      "level": levelCtrl.text.trim(),
      "profile_url":
          "https://eu.ui-avatars.com/api/?background=random&name=${fullNameCtrl.text}",
      "fullName": fullNameCtrl.text.trim(),
      "phone": phoneCtrl.text,
      "matric": matricCtrl.text,
      "hostel": hostelCtrl.text,
    };
    print(_payload.toString());
    showCustomLoading(title: 'Updating...');
    final result = await AuthenticationService.updateUserAccount(
        _payload, _auth.authUser.id!);
    hideLoading();
    if (result.hasError) {
      notifyError(content: result.message);
    } else {
      _auth.updateAuthUser(UserModel.fromJson(result.data), _auth.token);
      notifySuccess(content: result.message);
      Get.offNamedUntil('/dashboard', (route) => false);
    }
  }

  @override
  void onReady() {
    fullNameCtrl.text = _auth.authUser.fullName!;
    matricCtrl.text = _auth.authUser.matric!;
    phoneCtrl.text = _auth.authUser.phone!;
    levelCtrl.text = _auth.authUser.level!;
    departmentCtrl.text = _auth.authUser.department!;
    hostelCtrl.text = _auth.authUser.hostel!;
    super.onReady();
  }
}
