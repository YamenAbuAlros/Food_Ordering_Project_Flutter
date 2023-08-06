import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/utils.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.textcolor,
      this.fontsize,
      this.fontWeight});
  final String text;
  final double? fontsize;
  final Color? textcolor;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: storage.getAppLanguage() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: textcolor ?? AppColors.secondaryColor,
          // ignore: prefer_if_null_operators
          fontSize: fontsize ?? width * 0.035,
          // ignore: prefer_if_null_operators
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
