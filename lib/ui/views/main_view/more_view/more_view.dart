import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: height * 0.04,
              ),
              child: Row(
                children: [
                  CustomText(
                      text: tr("More"),
                      fontsize: 24,
                      fontWeight: FontWeight.bold,
                      textcolor: AppColors.primaryColor),
                  const Spacer(),
                  const CustomSvgPicture(imagename: 'shopping-cart'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: height * 0.04),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: height * 0.025),
                      decoration: BoxDecoration(
                          color: AppColors.textFormFieldColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.03))),
                      width: width * 0.09,
                      height: height * 0.04,
                      padding: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: const CustomSvgPicture(imagename: 'right'),
                    ),
                  ),
                  Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    color: AppColors.textFormFieldColor,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.15,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pointColor,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(width * 0.035),
                            child: const CustomSvgPicture(imagename: 'payment'),
                          ),
                        ),
                        (width * 0.04).sbw,
                        CustomText(
                            text: tr("Payment Details"),
                            fontsize: width * 0.035,
                            textcolor: AppColors.primaryColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: height * 0.02),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: height * 0.025),
                      decoration: BoxDecoration(
                          color: AppColors.textFormFieldColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.03))),
                      width: width * 0.09,
                      height: height * 0.04,
                      padding: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: const CustomSvgPicture(imagename: 'right'),
                    ),
                  ),
                  Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    color: AppColors.textFormFieldColor,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.15,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pointColor,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(width * 0.035),
                            child: const CustomSvgPicture(imagename: 'bag'),
                          ),
                        ),
                        (width * 0.04).sbw,
                        CustomText(
                            text: tr("My Orders"),
                            fontsize: width * 0.035,
                            textcolor: AppColors.primaryColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: height * 0.02),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: height * 0.025),
                      decoration: BoxDecoration(
                          color: AppColors.textFormFieldColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.03))),
                      width: width * 0.09,
                      height: height * 0.04,
                      padding: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: const CustomSvgPicture(imagename: 'right'),
                    ),
                  ),
                  Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    color: AppColors.textFormFieldColor,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.15,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pointColor,
                          ),
                          child: const Icon(Icons.notifications),
                        ),
                        (width * 0.04).sbw,
                        CustomText(
                            text: tr("Notifications"),
                            fontsize: width * 0.035,
                            textcolor: AppColors.primaryColor),
                        (width * 0.3).sbw,
                        Container(
                          padding: EdgeInsetsDirectional.all(width * 0.006),
                          width: width * 0.08,
                          height: height * 0.035,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.redColor,
                          ),
                          child: CustomText(
                              text: tr("15"), textcolor: AppColors.mainWhiteColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: height * 0.02),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: height * 0.025),
                      decoration: BoxDecoration(
                          color: AppColors.textFormFieldColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.03))),
                      width: width * 0.09,
                      height: height * 0.04,
                      padding: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: const CustomSvgPicture(imagename: 'right'),
                    ),
                  ),
                  Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    color: AppColors.textFormFieldColor,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.15,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pointColor,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(width * 0.03),
                            child: const CustomSvgPicture(imagename: 'inbox'),
                          ),
                        ),
                        (width * 0.04).sbw,
                        CustomText(
                            text: tr("Inbox"),
                            fontsize: width * 0.035,
                            textcolor: AppColors.primaryColor)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(top: height * 0.02, bottom: height * 0.024),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: height * 0.025),
                      decoration: BoxDecoration(
                          color: AppColors.textFormFieldColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.03))),
                      width: width * 0.09,
                      height: height * 0.04,
                      padding: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: const CustomSvgPicture(imagename: 'right'),
                    ),
                  ),
                  Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    color: AppColors.textFormFieldColor,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.15,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pointColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.03),
                            child: const CustomSvgPicture(
                                imagename: 'information'),
                          ),
                        ),
                        (width * 0.04).sbw,
                        CustomText(
                            text: tr("About Us"),
                            fontsize: width * 0.035,
                            textcolor: AppColors.primaryColor)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
