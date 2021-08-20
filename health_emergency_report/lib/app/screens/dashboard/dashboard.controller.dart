import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {
  int currentTabIndex = 1;
  PageController _controller = PageController(initialPage: 1);
  PageController get pageController => _controller;
  @override
  void onReady() {
    super.onReady();
  }

  void onNavBarChange(int index) {
    //update current tab index when clicked
    currentTabIndex = index;
    update();
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
