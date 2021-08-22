import 'package:health_emergency_report/app/components/buttons/linkable_text_button.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/auth/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/screens/auth/views/signup_view.dart';
import 'package:health_emergency_report/core/helpers/form_validator_utils.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController =
      Get.put<LoginController>(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    vSpaceSmall,
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    vSpaceSmall,
                    Text(
                      'Emergency Alert System',
                      style: kBodyText1,
                    ),
                    vSpaceMedium,
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: validateMatric,
                      focusNode: loginController.matricNode,
                      controller: loginController.matricCtrl,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(loginController.passwordNode),
                      decoration: InputDecoration(
                        hintText: 'Matric Number',
                      ),
                    ),
                    vSpaceSmall,
                    TextFormField(
                      obscureText: !loginController.showPassword,
                      controller: loginController.passwordCtrl,
                      focusNode: loginController.passwordNode,
                      validator: (value) =>
                          validateRequired(value!, 'password', minLength: 4),
                      onEditingComplete: () {
                        loginController.passwordNode.unfocus();
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: loginController.showPassword
                                ? Icon(Icons.lock)
                                : Icon(Icons.remove_red_eye),
                            onPressed: loginController.toggleShowPassword,
                          )),
                    ),
                    vSpaceLarge,
                    PrimaryButton(
                      title: 'Login',
                      onTap: loginController.handleOnSubmit,
                    ),
                    vSpaceMedium,
                    LinkableTextButton(
                      text: "Don't have an account?",
                      linkText: ' Register',
                      onTap: () => Get.to(
                        () => SignupView(),
                        transition: Transition.cupertino,
                      ),
                    ),
                    vSpaceTiny,
                    // LinkableTextButton(
                    //   text: "",
                    //   linkText: 'Forgot password',
                    //   onTap: () => Get.to(
                    //     () => ForgotPasswordView(),
                    //     transition: Transition.cupertino,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
