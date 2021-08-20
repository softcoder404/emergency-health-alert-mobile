import 'package:get/get.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:health_emergency_report/app/screens/dashboard/history/controller/history.controller.dart';

class HistoryView extends StatelessWidget {
  HistoryView({
    Key? key,
  }) : super(key: key);
  final HistoryController controller =
      Get.put<HistoryController>(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Health History',
          style: kSubheading.copyWith(color: kPrimaryColor),
        ),
      ),
      body: controller.history.isEmpty
          ? EmptyHistoryWidget()
          : SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
    );
  }
}

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 52,
            color: kPrimaryColor,
          ),
          vSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Health History Right Now!',
                style: kSubheading.copyWith(fontSize: 18, color: black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
