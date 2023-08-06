import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/utils.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          top: width * 0.03,
          bottom: width * 0.03),
      child: Row(
        children: [
          CustomText(
              text: text1,
              fontsize: width * 0.05,
              fontWeight: FontWeight.bold,
              textcolor: AppColors.primaryColor),
          const Spacer(),
          InkWell(
            child: CustomText(
                text: text2,
                textcolor: AppColors.mainOrangeColor,
                fontsize: width * 0.032,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
