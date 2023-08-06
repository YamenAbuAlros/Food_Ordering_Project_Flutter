import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: height * 0.05, start: width * 0.05, end: width * 0.05),
            child: Row(
              children: [
                CustomText(
                    text: tr("Latest Offers"),
                    fontsize: 24,
                    fontWeight: FontWeight.bold,
                    textcolor: AppColors.primaryColor),
                const Spacer(),
                const CustomSvgPicture(imagename: 'shopping-cart'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: height * 0.02,
                bottom: height * 0.028,
                start: width * 0.05),
            child: CustomText(
                text: tr("Find discounts, Offers special meals and more!"),
                fontsize: 14),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: width * 0.05),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: AppColors.mainOrangeColor,
                  fixedSize: Size(width * 0.4, height * 0.04)),
              onPressed: () {},
              child: CustomText(
                  text: tr("Check Offers"),
                  textcolor: AppColors.mainWhiteColor,
                  fontsize: 11),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/f1.jpg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: width * 0.05,
                      top: height * 0.005,
                      bottom: height * 0.003),
                  child: CustomText(
                      text: tr("Café de Noires"),
                      fontsize: 16,
                      textcolor: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: width * 0.05),
                  child: Row(
                    children: [
                      const CustomSvgPicture(imagename: 'star'),
                      CustomText(
                        text: tr("4.9 "),
                        textcolor: AppColors.mainOrangeColor,
                        fontsize: 11,
                      ),
                      CustomText(
                        text: tr("(124 ratings) Café Western Food"),
                        textcolor: AppColors.placeHolderColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/f2.jpg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: width * 0.05,
                      top: height * 0.005,
                      bottom: height * 0.003),
                  child: CustomText(
                      text: tr("Isso"),
                      fontsize: 16,
                      textcolor: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: width * 0.05),
                  child: Row(
                    children: [
                      const CustomSvgPicture(imagename: 'star'),
                      CustomText(
                          text: tr("4.9 "),
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: 11),
                      CustomText(
                          text: tr("(124 ratings) Café Western Food"),
                          textcolor: AppColors.placeHolderColor),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/f2.jpg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: width * 0.05,
                      top: height * 0.005,
                      bottom: height * 0.003),
                  child: CustomText(
                      text: tr("Cafe Beans"),
                      fontsize: 16,
                      textcolor: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: width * 0.05),
                  child: Row(
                    children: [
                      const CustomSvgPicture(imagename: 'star'),
                      CustomText(
                          text: tr("4.9 "),
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: 11),
                      CustomText(
                          text: tr("(124 ratings) Café Western Food"),
                          textcolor: AppColors.placeHolderColor),
                    ],
                  ),
                )
              ],
            ),
          ),
          (height * 0.12).sbh,
        ],
      ),
    );
  }
}
