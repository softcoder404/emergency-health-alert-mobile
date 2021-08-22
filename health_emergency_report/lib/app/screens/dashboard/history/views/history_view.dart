import 'package:get/get.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:health_emergency_report/app/screens/dashboard/history/controller/history.controller.dart';
import 'package:health_emergency_report/core/model/emergency_history_model.dart';
import 'package:health_emergency_report/core/utils/format_time.dart';

class HistoryView extends StatelessWidget {
  HistoryView({
    Key? key,
  }) : super(key: key);
  final HistoryController controller =
      Get.put<HistoryController>(HistoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (_) => Scaffold(
        backgroundColor: kPrimaryBorder.withOpacity(.08),
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Health History',
            style: kSubheading.copyWith(color: kPrimaryColor),
          ),
        ),
        body: controller.history.isEmpty
            ? EmptyHistoryWidget()
            : SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.history
                      .map((e) => HistoryCardWidget(
                            emergency: e,
                            onTap: () =>
                                controller.handleOnCancelUserRequest(e.id!),
                          ))
                      .toList(),
                ),
              ),
      ),
    );
  }
}

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key? key,
    required this.emergency,
    this.onTap,
  }) : super(key: key);
  final EmergencyHistoryModel emergency;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      emergency.title!.toUpperCase(),
                      style: kBodyText1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    vSpaceTiny,
                    Text(
                      emergency.description!,
                    ),
                    vSpaceSmall,
                    Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 14,
                        ),
                        hSpaceTiny,
                        Text(
                          timePeriod(emergency.createdAt!),
                          style: kBodyText1.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    vSpaceTiny,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                        ),
                        hSpaceTiny,
                        Expanded(
                          child: Text(
                            emergency.address!,
                            style: kBodyText1.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              hSpaceTiny,
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ambulance.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        vSpaceTiny,
        InkWell(
          onTap: onTap,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: kPrimaryColor,
            ),
            alignment: Alignment.center,
            child: Text(
              'Cancel Request',
              style: kButtonTextStyle,
            ),
          ),
        )
      ],
    );
  }
}

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 52,
            color: kPrimaryColor,
          ),
          vSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Health History Right Now!',
                style: kSubheading.copyWith(fontSize: 18, color: black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
