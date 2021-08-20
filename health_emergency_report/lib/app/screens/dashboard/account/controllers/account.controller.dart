import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';

class AccountController extends GetxController {
  String _contactUsNumber = '07014235169';

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
}
