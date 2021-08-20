import 'package:flutter/material.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/core/helpers/form_validator_utils.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: validateMatric,
                decoration: InputDecoration(
                  hintText: 'Enter your matric number',
                ),
              ),
              vSpaceLarge,
              PrimaryButton(
                bgColor: Colors.red,
                title: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
