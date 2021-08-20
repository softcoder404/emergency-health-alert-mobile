import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/confirmation_bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/mail.png',
                  height: 200,
                  width: 200,
                ),
                vSpaceMedium,
                Text(
                  'A confirmation link has been send to your email address, check your inbox and click on the link to verify your account.',
                  style: kBodyText3,
                  textAlign: TextAlign.center,
                ),
                vSpaceMedium,
                PrimaryButton(
                  title: 'Go Home',
                  onTap: () => Get.offAllNamed('login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
