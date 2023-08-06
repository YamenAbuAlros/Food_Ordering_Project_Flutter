import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodordering/core/enums/bottom_app_bar_items.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';

import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/bottom_navigation_widget/bottom_navigation_widget.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                    top: size.height * 0.05, left: size.width * 0.05),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Good morning Akila!',
                      fontsize: size.width * 0.049,
                      fontWeight: FontWeight.bold,
                      textcolor: AppColors.primaryColor,
                    ),
                    SizedBox(width: size.width * 0.35),
                    const CustomSvgPicture(imagename: 'shopping-cart'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.05),
                child: CustomText(
                    text: 'Delivering to',
                    fontsize: size.width * 0.029,
                    textcolor: AppColors.placeHolderColor,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: CustomText(
                    text: 'Current Location',
                    fontsize: size.width * 0.039,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    bottom: size.height * 0.04,
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.08))),
                      filled: true,
                      fillColor: AppColors.textFormFieldColor,
                      labelText: 'Search food',
                      labelStyle: TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w500),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: AppColors.secondaryColor),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.04),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                child: Image.asset('assets/images/f1.jpg',
                                    width: size.width * 0.25,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.12),
                              ),
                              CustomText(
                                  text: 'Offers',
                                  fontsize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  textcolor: AppColors.primaryColor)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.04),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/images/f3.jpg',
                                    width: size.width * 0.25,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.12),
                              ),
                              CustomText(
                                  text: 'Sri Lankan',
                                  fontsize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  textcolor: AppColors.primaryColor)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.04),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                child: Image.asset('assets/images/f1.jpg',
                                    width: size.width * 0.25,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.12),
                              ),
                              CustomText(
                                  text: 'Italian',
                                  fontsize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  textcolor: AppColors.primaryColor)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.04),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                child: Image.asset('assets/images/f3.jpg',
                                    width: size.width * 0.25,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.12),
                              ),
                              CustomText(
                                  text: 'Indian',
                                  fontsize: size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  textcolor: AppColors.primaryColor)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.06,
                    bottom: size.height * 0.03,
                    left: size.width * 0.05,
                    right: size.width * 0.05),
                child: Row(
                  children: [
                    CustomText(
                        text: 'Popular Restaurants',
                        fontsize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        textcolor: AppColors.primaryColor),
                    const Spacer(),
                    InkWell(
                      child: CustomText(
                          text: 'View all',
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: size.width * 0.032,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/f1.jpg', fit: BoxFit.cover),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: size.height * 0.005,
                        bottom: size.height * 0.003),
                    child: CustomText(
                        text: 'Minute by tuk tuk',
                        fontsize: size.width * 0.04,
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
                            fontsize: size.width * 0.03),
                        CustomText(
                            text: '(124 ratings) Café Western Food',
                            textcolor: AppColors.placeHolderColor),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/f2.jpg', fit: BoxFit.cover),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: size.height * 0.005,
                          bottom: size.height * 0.003),
                      child: CustomText(
                          text: 'Café de Noir',
                          fontsize: size.width * 0.04,
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
                              fontsize: size.width * 0.03),
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
                    Image.asset('assets/images/f3.jpg', fit: BoxFit.cover),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: size.height * 0.005,
                          bottom: size.height * 0.003),
                      child: CustomText(
                        text: 'Bakes by Tella',
                        fontsize: size.width * 0.04,
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Row(
                        children: [
                          const CustomSvgPicture(imagename: 'star'),
                          CustomText(
                              text: '4.9 ',
                              textcolor: AppColors.mainOrangeColor,
                              fontsize: size.width * 0.03),
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
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: Row(
                  children: [
                    CustomText(
                        text: 'Most Popular',
                        fontsize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        textcolor: AppColors.primaryColor),
                    const Spacer(),
                    InkWell(
                      child: CustomText(
                          text: 'View all',
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: size.width * 0.032,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.04,
                            bottom: size.height * 0.04,
                            left: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.05),
                              child: Image.asset('assets/images/f2.jpg',
                                  width: size.width * 0.7,
                                  fit: BoxFit.fill,
                                  height: size.height * 0.19),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: CustomText(
                                  text: 'Café De Bambaa',
                                  fontsize: size.width * 0.045,
                                  textcolor: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                CustomText(
                                    text: 'Café Western Food',
                                    textcolor: AppColors.placeHolderColor),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.07),
                                  child:
                                      const CustomSvgPicture(imagename: 'star'),
                                ),
                                CustomText(
                                  text: ' 4.9',
                                  textcolor: AppColors.mainOrangeColor,
                                  fontsize: size.width * 0.03,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.04,
                            bottom: size.height * 0.04,
                            left: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.05),
                              child: Image.asset('assets/images/f1.jpg',
                                  width: size.width * 0.7,
                                  fit: BoxFit.fill,
                                  height: size.height * 0.19),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: CustomText(
                                  text: 'Burger by Bella',
                                  fontsize: size.width * 0.045,
                                  textcolor: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                CustomText(
                                    text: 'Café Western Food',
                                    textcolor: AppColors.placeHolderColor),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.07),
                                  child:
                                      const CustomSvgPicture(imagename: 'star'),
                                ),
                                CustomText(
                                    text: ' 4.9',
                                    textcolor: AppColors.mainOrangeColor,
                                    fontsize: size.width * 0.03)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: Row(
                  children: [
                    CustomText(
                        text: 'Recent Items',
                        fontsize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        textcolor: AppColors.primaryColor),
                    const Spacer(),
                    InkWell(
                      child: CustomText(
                          text: 'View all',
                          textcolor: AppColors.mainOrangeColor,
                          fontsize: size.width * 0.032,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.03,
                    bottom: size.height * 0.025,
                    left: size.width * 0.05),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      child: Image.asset('assets/images/f2.jpg',
                          width: size.width * 0.2,
                          fit: BoxFit.fill,
                          height: size.height * 0.1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'Mulberry Pizza by Josh',
                              fontsize: size.width * 0.045,
                              textcolor: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                          CustomText(
                              text: 'Café Western Food',
                              textcolor: AppColors.placeHolderColor),
                          Row(
                            children: [
                              const CustomSvgPicture(imagename: 'star'),
                              CustomText(
                                  text: ' 4.9',
                                  textcolor: AppColors.mainOrangeColor,
                                  fontsize: size.width * 0.03),
                              CustomText(
                                  text: '  (124 ratings)',
                                  textcolor: AppColors.placeHolderColor),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.03,
                    bottom: size.height * 0.025,
                    left: size.width * 0.05),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      child: Image.asset('assets/images/f3.jpg',
                          width: size.width * 0.2,
                          fit: BoxFit.fill,
                          height: size.height * 0.1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'Barita',
                              fontsize: size.width * 0.04,
                              textcolor: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                          CustomText(
                              text: 'Café Coffee',
                              textcolor: AppColors.placeHolderColor),
                          Row(
                            children: [
                              const CustomSvgPicture(imagename: 'star'),
                              CustomText(
                                  text: ' 4.9',
                                  textcolor: AppColors.mainOrangeColor,
                                  fontsize: size.width * 0.03),
                              CustomText(
                                  text: '  (124 ratings)',
                                  textcolor: AppColors.placeHolderColor),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.03,
                    bottom: size.height * 0.15,
                    left: size.width * 0.05),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      child: Image.asset('assets/images/f1.jpg',
                          width: size.width * 0.2,
                          fit: BoxFit.fill,
                          height: size.height * 0.1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'Pizza Rush Hour',
                              fontsize: size.width * 0.04,
                              textcolor: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                          CustomText(
                              text: 'Café Italian Food',
                              textcolor: AppColors.placeHolderColor),
                          Row(
                            children: [
                              const CustomSvgPicture(imagename: 'star'),
                              CustomText(
                                  text: ' 4.9',
                                  textcolor: AppColors.mainOrangeColor,
                                  fontsize: size.width * 0.03),
                              CustomText(
                                  text: '  (124 ratings)',
                                  textcolor: AppColors.placeHolderColor),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.mainOrangeColor,
            child: Icon(Icons.home, color: AppColors.mainWhiteColor)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar.showCustomBottomAppBar(context,
            bottomAppBarItems: BottomAppBarItems.HOME),
      ),
    );
  }
}
