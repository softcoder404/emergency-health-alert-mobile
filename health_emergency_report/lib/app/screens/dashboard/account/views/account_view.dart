import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/controllers/account.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/views/edit_profile_view.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/widgets/account_menu_card_widget.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/widgets/top_profile_widget.dart';

class AccountView extends StatelessWidget {
  AccountView({Key? key}) : super(key: key);
  final AccountController controller =
      Get.put<AccountController>(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Account Page',
          style: kSubheading.copyWith(
            color: kPrimaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        width: double.infinity,
        height: screenHeight(context),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TopProfileCard(),
                    vSpaceSmall,
                    AccountMenuCard(
                      title: 'Edit Profile',
                      iconData: Icons.person,
                      onTap: () => Get.to(
                        () => EditAccountView(),
                        transition: Transition.upToDown,
                      ),
                    ),
                    AccountMenuCard(
                      title: 'Change Password',
                      iconData: Icons.password,
                    ),
                    AccountMenuCard(
                      title: 'Talk to Us',
                      iconData: Icons.call,
                    ),
                  ],
                ),
              ),
            ),
            vSpaceTiny,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              alignment: Alignment.center,
              child: Text(
                'Log Out',
                style: kButtonTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}