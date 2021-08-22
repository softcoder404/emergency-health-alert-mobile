import 'package:get_it/get_it.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<AuthUser>(() => AuthUser());
}
