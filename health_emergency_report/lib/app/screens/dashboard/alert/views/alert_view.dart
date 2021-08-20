import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/controller/alert.controller.dart';

class AlertView extends StatelessWidget {
  AlertView({
    Key? key,
  }) : super(key: key);

  final AlertController controller =
      Get.put<AlertController>(AlertController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertController>(
      builder: (controller) => Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Emergency Alert',
            style: kSubheading.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 80,
                child: Image.asset(
                  'assets/images/alert.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
