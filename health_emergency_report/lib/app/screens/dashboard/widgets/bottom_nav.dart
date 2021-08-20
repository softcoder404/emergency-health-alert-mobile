import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/screens/dashboard/dashboard.controller.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.currentTabIndex,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: black.withOpacity(.7),
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      unselectedLabelStyle: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      backgroundColor: white,
      onTap: controller.onNavBarChange,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            color: black.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.history,
            color: kPrimaryColor,
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.health_and_safety,
            color: black.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.health_and_safety,
            color: kPrimaryColor,
          ),
          label: 'Emergency Help',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: black.withOpacity(.3),
          ),
          activeIcon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          label: 'Accounts',
        ),
      ],
    );
  }
}
