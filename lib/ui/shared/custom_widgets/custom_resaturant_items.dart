import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:foodordering/ui/views/meal_details.dart';
import 'package:get/get.dart';

class CustomRestaurantItem extends StatelessWidget {
  const CustomRestaurantItem(
      {super.key, required this.mealList, required this.controller});
  final List mealList;
  final HomeViewController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mealList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => MealDetailsView(mealModel: mealList[index]));
              },
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: width,
                placeholder: (context, url) => CircularProgressIndicator(
                  color: AppColors.mainOrangeColor,
                  strokeWidth: 2,
                ),
                imageUrl: getFullImageUrl(mealList[index].images != null
                    ? mealList[index].images![0]
                    : mealList[index - 1].images![0]),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: width * 0.05,
                  end: width * 0.05,
                  top: height * 0.005,
                  bottom: height * 0.003),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: mealList[index].name!,
                      // text: 'Minute by tuk tuk',
                      fontsize: width * 0.04,
                      textcolor: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  CustomButton(
                    text: "+",
                    textColor: AppColors.mainWhiteColor,
                    paddingLR: width * 0.001,
                    widthSize: width * 0.15,
                    heightSize: height * 0.05,
                    onPressed: () {
                      controller.addToCart(mealList[index]);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Row(
                children: [
                  const CustomSvgPicture(imagename: 'star'),
                  CustomText(
                      text: '4.9 ',
                      textcolor: AppColors.mainOrangeColor,
                      fontsize: width * 0.03),
                  CustomText(
                      text: '(124 ratings) Café Western Food',
                      textcolor: AppColors.placeHolderColor),
                ],
              ),
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return (width * 0.01).sbh;
      },
    );
  }
}
