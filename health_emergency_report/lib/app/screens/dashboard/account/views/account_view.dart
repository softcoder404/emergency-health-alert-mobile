import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
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
      backgroundColor: kPrimaryBorder.withOpacity(.08),
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
                    TopProfileCard(
                      fullName: controller.auth.authUser.fullName,
                      matric: controller.auth.authUser.matric,
                      hostel: controller.auth.authUser.hostel,
                    ),
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
                      onTap: () => Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Change Password',
                                style: kBodyText1,
                              ),
                              vSpaceMedium,
                              TextFormField(
                                controller: controller.newPwdCtrl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                ),
                              ),
                              vSpaceMedium,
                              TextFormField(
                                obscureText: true,
                                controller: controller.cPwdCtrl,
                                decoration: InputDecoration(
                                  hintText: 'Confirm New Password',
                                ),
                              ),
                              Spacer(),
                              PrimaryButton(
                                title: 'Submit',
                                onTap: controller.changePassword,
                              ),
                              vSpaceMedium
                            ],
                          ),
                        ),
                      ),
                    ),
                    AccountMenuCard(
                      title: 'Talk to Us',
                      iconData: Icons.call,
                      onTap: controller.onTalkToUs,
                    ),
                  ],
                ),
              ),
            ),
            vSpaceTiny,
            InkWell(
              onTap: controller.logout,
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
