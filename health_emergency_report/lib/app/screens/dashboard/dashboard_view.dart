import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/controllers/account.controller.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/views/account_view.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/views/alert_view.dart';
import 'package:health_emergency_report/app/screens/dashboard/dashboard.controller.dart';
import 'package:health_emergency_report/app/screens/dashboard/history/views/history_view.dart';
import 'package:health_emergency_report/app/screens/dashboard/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor: white,
        body: PageView(
          onPageChanged: controller.onNavBarChange,
          controller: controller.pageController,
          children: <Widget>[
            HistoryView(),
            AlertView(),
            AccountView(),
          ],
        ),
        bottomNavigationBar: BottomNavBarWidget(
          controller: controller,
        ),
      ),
    );
  }
}
