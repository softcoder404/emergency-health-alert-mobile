import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:health_emergency_report/app/config/injector/get_it.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:health_emergency_report/app/screens/dashboard/admin.dashboard.controller.dart';
import 'package:health_emergency_report/core/model/emergency_history_model.dart';
import 'package:health_emergency_report/core/services/auth_user.injector.dart';
import 'package:health_emergency_report/core/utils/format_time.dart';

class AdminDashboardView extends StatelessWidget {
  AdminDashboardView({
    Key? key,
  }) : super(key: key);

  final AdminDashboardController controller =
      Get.put<AdminDashboardController>(AdminDashboardController());
  AuthUser _auth = locator<AuthUser>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminDashboardController>(
      builder: (_) => Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Emergency Reports',
            style: kSubheading.copyWith(color: kPrimaryColor),
          ),
        ),
        body: controller.emergencyHistory.isEmpty
            ? EmptyEmergencyWidget()
            : Container(
                width: double.infinity,
                height: screenHeight(context),
                padding: EdgeInsets.all(15.0),
                color: kPrimaryBorder.withOpacity(.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: screenWidth(context) * .8,
                    //   decoration: BoxDecoration(
                    //     color: kPrimaryColor.withOpacity(.05),
                    //     border: Border.all(color: kPrimaryColor),
                    //     borderRadius: BorderRadius.circular(4.0),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 50,
                    //         width: screenWidth(context) * .8 / 2 - 10,
                    //         margin: EdgeInsets.all(4.0),
                    //         decoration: BoxDecoration(
                    //           color: kPrimaryColor,
                    //           border: Border.all(color: kPrimaryColor),
                    //           borderRadius: BorderRadius.circular(4.0),
                    //         ),
                    //         child: Text(
                    //           'Open',
                    //           style: kBodyText2.copyWith(
                    //               color: white, fontWeight: FontWeight.bold),
                    //         ),
                    //         alignment: Alignment.center,
                    //       ),
                    //       Container(
                    //         height: 50,
                    //         width: screenWidth(context) * .8 / 2 - 10,
                    //         margin: EdgeInsets.all(4.0),
                    //         decoration: BoxDecoration(
                    //           color: kPrimaryColor,
                    //           border: Border.all(color: kPrimaryColor),
                    //           borderRadius: BorderRadius.circular(4.0),
                    //         ),
                    //         child: Text(
                    //           'Closed',
                    //           style: kBodyText2.copyWith(
                    //               color: white, fontWeight: FontWeight.bold),
                    //         ),
                    //         alignment: Alignment.center,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //  vSpaceMedium,
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: controller.emergencyHistory
                            .map((e) => EmergencyCard(
                                  emergency: e,
                                  onCallTap: () =>
                                      controller.callNumber(e.user!.phone!),
                                  onViewDirection: () =>
                                      controller.viewDirection(e.lat!, e.lng!),
                                  onConfirmRequest: () => e.status! ? controller.deleteRequest(e.id!) :
                                      controller.confirmEmergencyRequest(e.id!),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({
    Key? key,
    this.onCallTap,
    this.onConfirmRequest,
    this.onViewDirection,
    required this.emergency,
  }) : super(key: key);
  final EmergencyHistoryModel emergency;
  final VoidCallback? onCallTap;
  final VoidCallback? onViewDirection;
  final VoidCallback? onConfirmRequest;
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
                          '${timePeriod(emergency.createdAt!)}',
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
                child: Icon(
                  Icons.health_and_safety,
                  size: 50,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        vSpaceTiny,
        Container(
          height: 45,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: OutlineIconButton(
                  onTap: onCallTap,
                ),
              ),
              hSpaceTiny,
              Expanded(
                child: OutlineIconButton(
                  icon: Icons.directions,
                  title: 'View direction',
                  onTap: onViewDirection,
                ),
              )
            ],
          ),
        ),
        vSpaceSmall,
        InkWell(
          onTap: onConfirmRequest,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: emergency.status! ? kPrimaryColor : kSuccessColor,
            ),
            alignment: Alignment.center,
            child: Text(
              emergency.status! ? 'Remove Request' : 'Confirm Request',
              style: kButtonTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class OutlineIconButton extends StatelessWidget {
  const OutlineIconButton({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
    this.height,
  }) : super(key: key);
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.call_sharp,
              size: 18,
              color: kPrimaryColor,
            ),
            hSpaceSmall,
            Text(
              title ?? 'Call Sender',
              style: kBodyText3.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyEmergencyWidget extends StatelessWidget {
  const EmptyEmergencyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: screenHeight(context),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Waiting For An Emergency Reports',
            style: kSubheading.copyWith(
              color: black,
            ),
            textAlign: TextAlign.center,
          ),
          vSpaceSmall,
          Text(
            'Be on Alert!',
            style: kBodyText2.copyWith(
              color: black,
            ),
          ),
          vSpaceMedium,
          Container(
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
            alignment: Alignment.center,
            child: Icon(
              Icons.health_and_safety,
              color: kPrimaryColor,
              size: 70,
            ),
          ),
          vSpaceMedium,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'The system will notify you once an emergency report is received',
              style: kBodyText1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
