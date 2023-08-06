import 'package:flutter/material.dart';
import 'package:foodordering/core/enums/bottom_app_bar_items.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/bottom_navigation_widget/bottom_navigation_widget.dart';

import '../home_view/home_view.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                  ),
                  child: Row(
                    children: [
                      CustomText(
                          text: 'More',
                          fontsize: 24,
                          fontWeight: FontWeight.bold,
                          textcolor: AppColors.primaryColor),
                      const Spacer(),
                      const CustomSvgPicture(imagename: 'shopping-cart'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          decoration: BoxDecoration(
                              color: AppColors.textFormFieldColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.03))),
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: const CustomSvgPicture(imagename: 'right'),
                        ),
                      ),
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        color: AppColors.textFormFieldColor,
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pointColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.035),
                                child: const CustomSvgPicture(
                                    imagename: 'payment'),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            CustomText(
                                text: 'Payment Details',
                                fontsize: size.width * 0.035,
                                textcolor: AppColors.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          decoration: BoxDecoration(
                              color: AppColors.textFormFieldColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.03))),
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: const CustomSvgPicture(imagename: 'right'),
                        ),
                      ),
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        color: AppColors.textFormFieldColor,
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pointColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.035),
                                child: const CustomSvgPicture(imagename: 'bag'),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            CustomText(
                                text: 'My Orders',
                                fontsize: size.width * 0.035,
                                textcolor: AppColors.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          decoration: BoxDecoration(
                              color: AppColors.textFormFieldColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.03))),
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: const CustomSvgPicture(imagename: 'right'),
                        ),
                      ),
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        color: AppColors.textFormFieldColor,
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pointColor,
                              ),
                              child: const Icon(Icons.notifications),
                            ),
                            SizedBox(width: size.width * 0.04),
                            CustomText(
                                text: 'Notifications',
                                fontsize: size.width * 0.035,
                                textcolor: AppColors.primaryColor),
                            SizedBox(width: size.width * 0.3),
                            Container(
                              padding: EdgeInsets.all(size.width * 0.006),
                              width: size.width * 0.08,
                              height: size.height * 0.035,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.redColor,
                              ),
                              child: CustomText(
                                  text: '15',
                                  textcolor: AppColors.mainWhiteColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          decoration: BoxDecoration(
                              color: AppColors.textFormFieldColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.03))),
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: const CustomSvgPicture(imagename: 'right'),
                        ),
                      ),
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        color: AppColors.textFormFieldColor,
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pointColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.03),
                                child:
                                    const CustomSvgPicture(imagename: 'inbox'),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            CustomText(
                                text: 'Inbox',
                                fontsize: size.width * 0.035,
                                textcolor: AppColors.primaryColor)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02, bottom: size.height * 0.024),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          decoration: BoxDecoration(
                              color: AppColors.textFormFieldColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.03))),
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: const CustomSvgPicture(imagename: 'right'),
                        ),
                      ),
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        color: AppColors.textFormFieldColor,
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pointColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.03),
                                child: const CustomSvgPicture(
                                    imagename: 'information'),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            CustomText(
                                text: 'About Us',
                                fontsize: size.width * 0.035,
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
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomeView();
              }));
            },
            backgroundColor: AppColors.placeHolderColor,
            child: Icon(
              Icons.home,
              color: AppColors.mainWhiteColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar.showCustomBottomAppBar(context,
            bottomAppBarItems: BottomAppBarItems.MORE),
      ),
    );
  }
}
