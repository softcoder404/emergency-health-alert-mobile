import 'package:flutter/material.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';

class TopProfileCard extends StatelessWidget {
  const TopProfileCard({
    Key? key,
    this.fullName,
    this.hostel,
    this.matric,
  }) : super(key: key);
  final String? fullName;
  final String? matric;
  final String? hostel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: black,
            backgroundImage: NetworkImage(
                'https://eu.ui-avatars.com/api/?background=random&name=$fullName'),
          ),
          vSpaceTiny,
          Text(
            fullName ?? 'AbdulHameed Quadri',
            style: kHeadingText3.copyWith(
              fontStyle: FontStyle.normal,
            ),
          ),
          vSpaceVeryTiny,
          Text(
            matric ?? '14/30GC/161',
            style: kBodyText3.copyWith(),
          ),
          vSpaceSmall,
          Text(
            hostel ?? 'Room 16, Lagos Hostel, Bowen University',
            style: kBodyText4,
          )
        ],
      ),
    );
  }
}
