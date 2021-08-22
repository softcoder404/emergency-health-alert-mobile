import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/notifications/notification.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/views/success_view.dart';
import 'package:health_emergency_report/core/model/emergency_option_model.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/services/emergency_service.dart';
import 'package:health_emergency_report/core/services/location_service.dart';

class EmergencyOptionController extends GetxController {
  List<EmergencyOptionModel> _emergencyOptions = [
    EmergencyOptionModel(
      category: 'Category A',
      descriptions:
          'A life threatening condition, such as cardiac or respiratory arrest',
    ),
    EmergencyOptionModel(
      category: 'Category B',
      descriptions:
          'A serious conditions, such as stroke or chest pain, which may require urgent transport',
    ),
    EmergencyOptionModel(
      category: 'Category C',
      descriptions:
          'An urgent problem, such as an uncomplicated diabetic issue, which requires treatment and transport to an acute setting',
    ),
    EmergencyOptionModel(
      category: 'Category D',
      descriptions: 'A serious road accident that require urgent attention',
    ),
    EmergencyOptionModel(
      category: 'Category E',
      descriptions:
          'A non-urgent problem, such as stable clinical cases, which requires transportation to a hospital ward or clinic',
    ),
  ];
  List<EmergencyOptionModel> get emergencyOptions => _emergencyOptions;
  EmergencyOptionModel? _selectedOption;
  EmergencyOptionModel? get selectedOption => _selectedOption;
  void onOptionSelected(EmergencyOptionModel? option) {
    _selectedOption = option!;
    update();
  }

  Future<void> onSubmit() async {
    if (_selectedOption != null) {
      showCustomLoading(title: 'Making Request...');
      final p = await LocationService.getPosition();
      final _result = await LocationService.getReverseGeocoding(p);
      if (_result.hasError) {
        hideLoading();
        notifyError(content: _result.message);
      } else {
        String _address = _result.data.toString();
        AuthUser _authUser = locator<AuthUser>();
        Map<String, dynamic> _payload = {
          "user_id": _authUser.authUser.id,
          "lat": p.latitude.toString(),
          "lng": p.longitude.toString(),
          "address": _address,
          "title": _selectedOption!.category,
          "description": _selectedOption!.descriptions,
          "timestamp": DateTime.now().toString(),
        };

        final result = await EmergencyService.report(_payload);
        if (result.hasError) {
          notifyError(content: result.message);
        } else {
          notifySuccess(content: result.message);
          Get.off(
            () => SuccessView(),
            transition: Transition.upToDown,
          );
        }
      }
    } else {
      notifyError(content: 'select an emergency type');
    }
  }
}
