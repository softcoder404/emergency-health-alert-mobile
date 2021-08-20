import 'package:health_emergency_report/app/config/themes/colors.dart';
import 'package:health_emergency_report/app/config/themes/styles.dart';
import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    this.borderColor,
    this.width,
  }) : super(key: key);
  final Color? borderColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150.0,
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor ?? white,
          ),
        ),
      ),
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        textAlign: TextAlign.center,
        style: kHeadingText3,
        decoration: InputDecoration(
          focusColor: kPrimaryColor,
        ),
      ),
    );
  }
}
