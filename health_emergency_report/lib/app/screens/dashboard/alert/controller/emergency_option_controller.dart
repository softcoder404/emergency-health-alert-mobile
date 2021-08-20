import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/views/success_view.dart';
import 'package:health_emergency_report/core/model/emergency_option_model.dart';

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
  late EmergencyOptionModel _selectedOption;
  EmergencyOptionModel get selectedOption => _selectedOption;
  void onOptionSelected(EmergencyOptionModel? option) {
    _selectedOption = option!;
    update();
  }

  @override
  void onReady() {
    _selectedOption = _emergencyOptions[0];
    update();
    super.onReady();
  }

  void onSubmit() => Get.off(
        () => SuccessView(),
        transition: Transition.upToDown,
      );
}
