import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:health_emergency_report/app/components/buttons/linkable_text_button.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/auth/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/core/helpers/form_validator_utils.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  SignupController _controller = Get.put<SignupController>(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back_ios,
              color: black,
            )),
        actions: [
          Center(
            child: Text(
              'Create Account',
              style: kBodyText2,
            ),
          ),
          hSpaceSmall,
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<SignupController>(
          builder: (_) => Container(
            height: screenHeight(context),
            width: screenWidth(context),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Let\'s Get You Started',
                          style: kHeadingText2,
                        ),
                      ),
                      vSpaceSmall,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: validateFullName,
                        controller: _controller.fullNameCtrl,
                        focusNode: _controller.fullNameNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.matricNode),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        controller: _controller.matricCtrl,
                        focusNode: _controller.matricNode,
                        validator: validateMatric,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.phoneNode),
                        decoration: InputDecoration(
                          hintText: 'Matric Number',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 55,
                            decoration: BoxDecoration(
                              color: kPrimaryBorder.withOpacity(.2),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            alignment: Alignment.center,
                            child: CountryCodePicker(
                              alignLeft: false,
                              textStyle: kBodyText3,
                              onChanged: (code) =>
                                  _controller.onCountryCodeChange(code.code!),
                              initialSelection: 'NG',
                              favorite: ['NG', 'US', 'CA'],
                            ),
                          ),
                          hSpaceTiny,
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              cursorColor: kPrimaryColor,
                              style: kBodyText2,
                              validator: validatePhone,
                              controller: _controller.phoneCtrl,
                              focusNode: _controller.phoneNode,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_controller.hostelNode),
                              decoration: InputDecoration(
                                hintText: 'Phone Number e.g 07014xxx',
                                hintStyle:
                                    kBodyText4.copyWith(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) =>
                            validateRequired(value!, 'hostel', minLength: 6),
                        controller: _controller.hostelCtrl,
                        focusNode: _controller.hostelNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.passwordNode),
                        decoration: InputDecoration(
                          hintText: 'Hostel',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        obscureText: _controller.showPassword,
                        validator: validatePassword,
                        controller: _controller.passwordCtrl,
                        focusNode: _controller.passwordNode,
                        onEditingComplete: () {
                          _controller.passwordNode.unfocus();
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                          suffixIcon: IconButton(
                            icon: _controller.showPassword
                                ? Icon(Icons.lock)
                                : Icon(Icons.remove_red_eye),
                            onPressed: _controller.toggleShowPassword,
                          ),
                        ),
                      ),
                      vSpaceMedium,
                      PrimaryButton(
                        title: 'Sign up',
                        onTap: _controller.handleOnSignup,
                      ),
                      vSpaceMedium,
                      LinkableTextButton(
                        text: 'Already have an account?',
                        linkText: ' Login',
                        onTap: () =>
                            Get.offNamedUntil('/login', (route) => false),
                      ),
                      vSpaceMedium,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
