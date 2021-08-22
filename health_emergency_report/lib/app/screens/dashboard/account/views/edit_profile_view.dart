import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/dashboard/account/controllers/edit_account_controller.dart';
import 'package:health_emergency_report/core/helpers/form_validator_utils.dart';

class EditAccountView extends StatelessWidget {
  EditAccountView({Key? key}) : super(key: key);
  final EditAccountController _controller =
      Get.put<EditAccountController>(EditAccountController());
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
              'Edit Account',
              style: kBodyText2,
            ),
          ),
          hSpaceSmall,
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<EditAccountController>(
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
                          'Edit Your Profile',
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
                        enabled: false,
                        cursorColor: kPrimaryColor,
                        controller: _controller.matricCtrl,
                        focusNode: _controller.matricNode,
                        validator: null,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.phoneNode),
                        decoration: InputDecoration(
                          hintText: 'Matric Number',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        cursorColor: kPrimaryColor,
                        enabled: false,
                        style: kBodyText2,
                        validator: null,
                        controller: _controller.phoneCtrl,
                        focusNode: _controller.phoneNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.hostelNode),
                        decoration: InputDecoration(
                          hintText: 'Phone Number e.g 07014xxx',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
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
                            .requestFocus(_controller.departmentNode),
                        decoration: InputDecoration(
                          hintText: 'Hostel',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) => validateRequired(
                            value!, 'department',
                            minLength: 6),
                        controller: _controller.departmentCtrl,
                        focusNode: _controller.departmentNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_controller.levelNode),
                        decoration: InputDecoration(
                          hintText: 'Department e.g Elect/Elect',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      TextFormField(
                        style: kBodyText3,
                        cursorColor: kPrimaryColor,
                        validator: (value) =>
                            validateRequired(value!, 'level', minLength: 2),
                        controller: _controller.levelCtrl,
                        focusNode: _controller.levelNode,
                        onEditingComplete: () {
                          _controller.levelNode.unfocus();
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: 'Level e.g 200 Level',
                          hintStyle: kBodyText4.copyWith(color: Colors.black),
                        ),
                      ),
                      vSpaceMedium,
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: PrimaryButton(
                          title: 'Save Changes',
                          onTap: () => _controller.handleOnSaveChange(),
                        ),
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
