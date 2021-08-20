import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenHeight(context),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ambulance.png',
              height: 180,
              width: 180,
              fit: BoxFit.fill,
            ),
            Text(
              'Request Sent!',
              style: kSubheading.copyWith(color: black),
            ),
            vSpaceSmall,
            Text(
              'An ambulance will be sent to you current location shortly',
              style: kBodyText1,
              textAlign: TextAlign.center,
            ),
            vSpaceMedium,
            PrimaryButton(
              title: 'Go back Home',
              onTap: () => Get.offNamedUntil('/dashboard', (route) => false),
            )
          ],
        ),
      ),
    );
  }
}
