import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditAccountController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    if (formKey.currentState!.validate()) {
      Get.offNamedUntil('/dashboard', (route) => false);
    }
  }
}
