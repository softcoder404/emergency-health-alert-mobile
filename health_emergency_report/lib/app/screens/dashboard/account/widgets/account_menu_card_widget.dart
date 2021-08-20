import 'package:flutter/material.dart';
import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/spacing.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';

class AccountMenuCard extends StatelessWidget {
  const AccountMenuCard({
    Key? key,
    required this.iconData,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String? title;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(
                iconData,
                size: 20,
                color: kPrimaryColor,
              ),
            ),
            hSpaceSmall,
            Text(
              title ?? 'My Favorites',
              style: kBodyText2.copyWith(color: black),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor.withOpacity(.6),
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
