import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodordering/core/enums/bottom_app_bar_items.dart';

import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/home_view/home_view.dart';

class DessertsView extends StatefulWidget {
  const DessertsView({super.key});

  @override
  State<DessertsView> createState() => _DessertsViewState();
}

class _DessertsViewState extends State<DessertsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05, left: size.width * 0.05),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CustomSvgPicture(imagename: 'star', width: 30),
                  ),
                  CustomText(
                      text: 'Desserts',
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                      textcolor: AppColors.primaryColor),
                  SizedBox(
                    width: size.width * 0.55,
                  ),
                  const CustomSvgPicture(imagename: 'shopping-cart')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.03,
                  bottom: size.height * 0.025,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: TextFormField(
                decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.06,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFormFieldColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    fillColor: AppColors.textFormFieldColor,
                    labelText: 'Search food',
                    labelStyle: TextStyle(
                        color: AppColors.placeHolderColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: AppColors.secondaryColor),
              ),
            ),
            Column(children: [
              Stack(children: [
                Image.asset('assets/images/cake3.jpg',
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07,
                          top: size.height * 0.15,
                          bottom: size.height * 0.003),
                      child: CustomText(
                          text: 'French Apple Pie',
                          fontsize: 16,
                          textcolor: AppColors.mainWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, bottom: size.height * 0.03),
                      child: Row(
                        children: [
                          const CustomSvgPicture(imagename: 'star'),
                          CustomText(
                              text: '4.9 ',
                              textcolor: AppColors.mainOrangeColor,
                              fontsize: 11),
                          CustomText(
                              text: 'Minute by tuk tuk Desserts',
                              textcolor: AppColors.mainWhiteColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: size.height * 0.01),
              Stack(children: [
                Image.asset('assets/images/cake2.jpg',
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07,
                          top: size.height * 0.15,
                          bottom: size.height * 0.003),
                      child: CustomText(
                          text: 'Dark Chocolate Cake',
                          fontsize: 16,
                          textcolor: AppColors.mainWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, bottom: size.height * 0.03),
                      child: Row(
                        children: [
                          const CustomSvgPicture(imagename: 'star'),
                          CustomText(
                              text: '4.7 ',
                              textcolor: AppColors.mainOrangeColor,
                              fontsize: 11),
                          CustomText(
                              text: 'Cakes by Tella Desserts',
                              textcolor: AppColors.mainWhiteColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: size.height * 0.01),
              Stack(children: [
                Image.asset('assets/images/ice1.jpg',
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07,
                          top: size.height * 0.15,
                          bottom: size.height * 0.003),
                      child: CustomText(
                          text: 'Street Shake',
                          fontsize: 16,
                          textcolor: AppColors.mainWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, bottom: size.height * 0.03),
                      child: Row(
                        children: [
                          const CustomSvgPicture(imagename: 'star'),
                          CustomText(
                              text: '4.9 ',
                              textcolor: AppColors.mainOrangeColor,
                              fontsize: 11),
                          CustomText(
                              text: 'Café Racer Desserts',
                              textcolor: AppColors.mainWhiteColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: size.height * 0.01),
              Stack(children: [
                Image.asset('assets/images/ice2.jpg',
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07,
                          top: size.height * 0.15,
                          bottom: size.height * 0.003),
                      child: CustomText(
                          text: 'Fudgy Chewy Brownies',
                          fontsize: 16,
                          textcolor: AppColors.mainWhiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, bottom: size.height * 0.03),
                      child: Row(
                        children: [
                          const CustomSvgPicture(
                            imagename: 'star',
                          ),
                          CustomText(
                              text: '4.9 ',
                              textcolor: AppColors.mainOrangeColor,
                              fontsize: 11),
                          CustomText(
                              text: 'Minute by tuk tuk Desserts',
                              textcolor: AppColors.mainWhiteColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: size.height * 0.17),
            ]),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomeView();
              }));
            },
            backgroundColor: AppColors.placeHolderColor,
            child: Icon(Icons.home, color: AppColors.mainWhiteColor)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar.showCustomBottomAppBar(context,
            bottomAppBarItems: BottomAppBarItems.MENU),
      ),
    );
  }
}
