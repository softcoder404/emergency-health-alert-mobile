import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/core/model/emergency_history_model.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/emergency_service.dart';

class HistoryController extends GetxController {
  List<EmergencyHistoryModel> _history = [];
  List<EmergencyHistoryModel> get history => _history;
  final AuthUser _auth = locator<AuthUser>();

  Future<void> getUserHistory() async {
    showCustomLoading(title: 'fetching history');
    final result =
        await EmergencyService.getUserEmergencyHistory(_auth.authUser.id!);
    hideLoading();
    if (result.hasError) {
      notifyError(content: result.message);
    } else {
      _history = result.data;
      update();
    }
  }

  Future<void> handleOnCancelUserRequest(String id) async {
    showCustomLoading(title: 'canceling request...');
    final result = await EmergencyService.cancelRequest(id);
    hideLoading();
    if (result.hasError) {
      notifyError(content: result.message);
    } else {
      notifySuccess(content: result.message);
      await getUserHistory();
    }
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getUserHistory();
    super.onReady();
  }
}
