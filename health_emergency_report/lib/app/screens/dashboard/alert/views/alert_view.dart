import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/controller/alert.controller.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/views/emergency_option_view.dart';

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
            'Emergency Help',
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
              Text(
                'Emergency Help Needed?',
                style: kSubheading.copyWith(
                  color: black,
                ),
              ),
              vSpaceSmall,
              Text(
                'Double Tap On The Button!',
                style: kBodyText2.copyWith(
                  color: black,
                ),
              ),
              vSpaceMedium,
              InkWell(
                onDoubleTap: () => Get.to(
                  () => EmergencyOptionView(),
                  transition: Transition.upToDown,
                ),
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 6,
                    ),
                    borderRadius: BorderRadius.circular(80),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: kPrimaryColor.withOpacity(.1),
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: kPrimaryColor.withOpacity(.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      'assets/images/alert.png',
                    ),
                  ),
                ),
              ),
              vSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'The system will automatically send your current location to an emergency help center',
                  style: kBodyText1,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
