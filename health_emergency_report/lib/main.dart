import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

import 'app/config/themes/theme.dart';
import 'app/screens/auth/views/login_view.dart';
import 'app/screens/dashboard/dashboard_view.dart';
import 'core/bindings/dashboard.binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: theme(context),
      title: "Emergency Health Alert",
      initialRoute: "/login",
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardView(),
          binding: DashboardBinding(),
        ),
      ],
    );
  }
}
