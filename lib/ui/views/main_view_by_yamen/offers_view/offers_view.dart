import 'package:flutter/material.dart';

import 'package:foodordering/core/enums/bottom_app_bar_items.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/home_view/home_view.dart';


class OffersView extends StatelessWidget {
  const OffersView({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: Row(
                children: [
                  CustomText(
                      text: 'Latest Offers',
                      fontsize: 24,
                      fontWeight: FontWeight.bold,
                      textcolor: AppColors.primaryColor),
                  const Spacer(),
                  const CustomSvgPicture(imagename: 'shopping-cart'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  bottom: size.height * 0.028,
                  left: size.width * 0.05),
              child: const CustomText(
                  text: 'Find discounts, Offers special meals and more!',
                  fontsize: 14),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: AppColors.mainOrangeColor,
                    fixedSize: Size(size.width * 0.4, size.height * 0.04)),
                onPressed: () {},
                child: CustomText(
                    text: 'Check Offers',
                    textcolor: AppColors.mainWhiteColor,
                    fontsize: 11),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/f1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: size.height * 0.005,
                        bottom: size.height * 0.003),
                    child: CustomText(
                        text: 'Café de Noires',
                        fontsize: 16,
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Row(
                      children: [
                        const CustomSvgPicture(imagename: 'star'),
                        CustomText(
                          text: '4.9 ',
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: 11,
                        ),
                        CustomText(
                          text: '(124 ratings) Café Western Food',
                          textcolor: AppColors.placeHolderColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/f2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: size.height * 0.005,
                        bottom: size.height * 0.003),
                    child: CustomText(
                        text: 'Isso',
                        fontsize: 16,
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Row(
                      children: [
                        const CustomSvgPicture(imagename: 'star'),
                        CustomText(
                            text: '4.9 ',
                            textcolor: AppColors.mainOrangeColor,
                            fontsize: 11),
                        CustomText(
                            text: '(124 ratings) Café Western Food',
                            textcolor: AppColors.placeHolderColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/f2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: size.height * 0.005,
                        bottom: size.height * 0.003),
                    child: CustomText(
                        text: 'Cafe Beans',
                        fontsize: 16,
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Row(
                      children: [
                        const CustomSvgPicture(imagename: 'star'),
                        CustomText(
                            text: '4.9 ',
                            textcolor: AppColors.mainOrangeColor,
                            fontsize: 11),
                        CustomText(
                            text: '(124 ratings) Café Western Food',
                            textcolor: AppColors.placeHolderColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.12,
            )
          ],
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
          bottomAppBarItems: BottomAppBarItems.OFFERS),
    ));
  }
}
