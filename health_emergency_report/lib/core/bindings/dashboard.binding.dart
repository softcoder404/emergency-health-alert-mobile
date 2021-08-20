import 'package:get/get.dart';
import 'package:health_emergency_report/app/screens/dashboard/dashboard.controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController(), permanent: true);
  }
}
