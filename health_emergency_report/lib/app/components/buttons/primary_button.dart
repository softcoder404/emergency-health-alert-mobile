import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    this.title,
    this.bgColor,
    this.txtColor,
  }) : super(key: key);
  final void Function()? onTap;
  final String? title;
  final Color? bgColor;
  final Color? txtColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 220,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => bgColor ?? Colors.redAccent),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25.0,
            )),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title ?? 'Continue',
          style: kButtonTextStyle.copyWith(
              color: txtColor ?? white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
