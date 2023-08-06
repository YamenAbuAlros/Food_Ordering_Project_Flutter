import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/custom/custom_category_item.dart';
import 'package:foodordering/ui/custom/custom_popular_item.dart';
import 'package:foodordering/ui/custom/custom_recent_item.dart';

import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_heading.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_resaturant_items.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: height * 0.05, start: width * 0.05),
            child: Row(
              children: [
                CustomText(
                  text: tr("Good morning Akila!"),
                  fontsize: width * 0.049,
                  fontWeight: FontWeight.bold,
                  textcolor: AppColors.primaryColor,
                ),
                (width * 0.2).sbw,
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/ic_notification.svg",
                      width: width * 0.06,
                      color: AppColors.mainOrangeColor,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(width * 0.01))),
                      margin: EdgeInsetsDirectional.only(start: width * 0.035),
                      child: Obx(
                        () => Text(
                          "${controller.numberOfNotifications.value}",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              color: AppColors.mainWhiteColor),
                        ),
                      ),
                    )
                  ],
                ),
                Obx(
                  () => controller.isOnline.value
                      ? Icon(
                          Icons.wifi,
                          color: AppColors.greenColor,
                        )
                      : Icon(
                          Icons.wifi_off,
                          color: AppColors.redColor,
                        ),
                ),
                Stack(
                  children: [
                    const CustomSvgPicture(imagename: 'shopping-cart'),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(width * 0.01))),
                      // padding: EdgeInsetsDirectional.all(width * 0.01),
                      margin: EdgeInsetsDirectional.only(start: width * 0.03),
                      child: Obx(
                        () => Text(
                          "${cartServices.cartCount.value}",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              color: AppColors.mainWhiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: height * 0.03, start: width * 0.05),
            child: CustomText(
                text: tr("Delivering to"),
                fontsize: width * 0.029,
                textcolor: AppColors.placeHolderColor,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: width * 0.05,
            ),
            child: CustomText(
                text: tr("Current Location"),
                fontsize: width * 0.039,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * 0.05, vertical: height * 0.04),
            child: TextFormField(
              onChanged: (value) {
                controller.searchFood(value);
              },
              decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: height * 0.06,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.textFormFieldColor),
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.08))),
                  filled: true,
                  fillColor: AppColors.textFormFieldColor,
                  labelText: tr("Search food"),
                  labelStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColors.secondaryColor),
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: Obx(
              () {
                return controller.isCategoryLoading
                    ? SpinKitCircle(
                        color: AppColors.mainOrangeColor,
                      )
                    : CustomCategoryItem(
                        // ignore: invalid_use_of_protected_member
                        categoryList: controller.categoryList.value);
              },
            ),
          ),
          CustomHeading(
              text1: tr("Popular Restaurants"), text2: tr("View all")),
          Obx(() {
            return controller.isMealLoading
                ? SpinKitCircle(
                    color: AppColors.mainOrangeColor,
                  )
                // ignore: invalid_use_of_protected_member
                : CustomRestaurantItem(
                    mealList: controller.mealList.value,
                    controller: controller,
                  );
          }),
          CustomHeading(text1: tr("Most Popular"), text2: tr("View all")),
          SizedBox(
            height: height * 0.2,
            child: Obx(() {
              return controller.isCategoryLoading
                  ? SpinKitCircle(
                      color: AppColors.mainOrangeColor,
                    )
                  : CustomPopularItem(
                      // ignore: invalid_use_of_protected_member
                      categoryList: controller.categoryList.value);
            }),
          ),
          CustomHeading(text1: tr("Recent Items"), text2: tr("View all")),
          Obx(() {
            return controller.isMealLoading
                ? SpinKitCircle(
                    color: AppColors.mainOrangeColor,
                  )
                // ignore: invalid_use_of_protected_member
                : CustomRecentItem(mealList: controller.mealList.value);
          }),
        ],
      ),
    );
  }
}
