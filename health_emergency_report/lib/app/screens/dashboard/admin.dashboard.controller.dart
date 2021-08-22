import 'dart:async';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/core/model/emergency_history_model.dart';
import 'package:health_emergency_report/core/services/emergency_service.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AdminDashboardController extends GetxController {
  List<EmergencyHistoryModel> _emergencyList = [];
  List<EmergencyHistoryModel> get emergencyHistory => _emergencyList;
  late Timer _timer;
  @override
  void onReady() async {
    // TODO: implement
    await getEmergency();
    _timer = Timer.periodic(Duration(seconds: 40), (_timer) async {
      await getEmergency();
    });
    super.onReady();
  }

  Future<void> getEmergency() async {
    final result = await EmergencyService.getAllEmergencyHistory();
    if (result.hasError) {
      notifyError(content: result.message);
    } else {
      _emergencyList = result.data;
      update();
    }
  }

  Future<void> deleteRequest(String _id) async {
    showCustomLoading(title: 'Deleting request...');
    final result = await EmergencyService.cancelRequest(_id);
    if (result.hasError) {
      hideLoading();
      notifyError(content: result.message);
    } else {
      await getEmergency();
      hideLoading();
      notifySuccess(content: result.message);
    }
  }

  Future<void> confirmEmergencyRequest(String _id) async {
    showCustomLoading(title: 'Confirming request...');
    final result = await EmergencyService.confirmEmergencyRequest(_id);
    if (result.hasError) {
      hideLoading();
      notifyError(content: result.message);
    } else {
      await getEmergency();
      hideLoading();
      notifySuccess(content: result.message);
    }
  }

  void callNumber(String phone) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phone);
    if (res == null) {
      notifyError(
          content:
              'Unable to open phone dialer, call this number instead: $phone');
    }
  }

  void viewDirection(String lat, String lng) async {
    bool opened = await MapsLauncher.launchCoordinates(
        double.parse(lat), double.parse(lng), 'Emergency Location');
    if (!opened) {
      notifyError(
          content: 'Unable to open google map, for lat: $lat, lng: $lng');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _timer.cancel();
    super.onClose();
  }
}
