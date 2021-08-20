import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/components/buttons/primary_button.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/dashboard/alert/controller/emergency_option_controller.dart';
import 'package:health_emergency_report/core/model/emergency_option_model.dart';

class EmergencyOptionView extends StatelessWidget {
  EmergencyOptionView({Key? key}) : super(key: key);
  final EmergencyOptionController _controller =
      Get.put<EmergencyOptionController>(EmergencyOptionController());
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
              'Emergency Type',
              style: kBodyText2,
            ),
          ),
          hSpaceSmall,
        ],
      ),
      body: GetBuilder<EmergencyOptionController>(
        builder: (_) => Container(
          height: screenHeight(context),
          width: screenWidth(context),
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select An Emergency Type',
                  style: kSubheading.copyWith(color: black),
                ),
              ),
              vSpaceSmall,
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: _controller.emergencyOptions
                      .map(
                        (option) => OptionBox(
                          option: option,
                          isSelected: option == _controller.selectedOption,
                          onTap: _controller.onOptionSelected,
                          category: option.category,
                          description: option.descriptions,
                        ),
                      )
                      .toList(),
                ),
              ),
              PrimaryButton(
                title: 'Submit',
                onTap: _controller.onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  const OptionBox({
    Key? key,
    this.category,
    this.description,
    this.isSelected = false,
    this.option,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String? category;
  final String? description;
  final EmergencyOptionModel? option;
  final void Function(EmergencyOptionModel?) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(option),
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: kPrimaryBorder.withOpacity(.05),
          border: Border.all(
            color: isSelected
                ? Colors.redAccent
                : Colors.redAccent.withOpacity(.3),
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category!.toUpperCase(),
                    style: kBodyText3.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  vSpaceTiny,
                  Text(
                    description!,
                    style: kBodyText2,
                  ),
                ],
              ),
            ),
            hSpaceTiny,
            Icon(
              Icons.check_circle_outline,
              color: isSelected
                  ? Colors.redAccent
                  : Colors.redAccent.withOpacity(.3),
            )
          ],
        ),
      ),
    );
  }
}
