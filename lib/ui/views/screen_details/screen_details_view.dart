import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/home_view/home_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScreenDetailsView extends StatefulWidget {
  const ScreenDetailsView({super.key});

  @override
  State<ScreenDetailsView> createState() => _ScreenDetailsViewState();
}

class _ScreenDetailsViewState extends State<ScreenDetailsView> {
  List image = [
    'assets/images/Find_food_you_love_vector.svg',
    'assets/images/Live_tracking_vector.svg',
    'assets/images/Delivery_vector.svg'
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            (height * 0.1).pdt,
            CarouselSlider(
              options: CarouselOptions(
                height: height * 0.4,
                aspectRatio: 16 / 9,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (i, _) {
                  setState(() {
                    index = i;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: image.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: const BoxDecoration(),
                        child: SvgPicture.asset(
                          image[index],
                          fit: BoxFit.fill,
                        ));
                  },
                );
              }).toList(),
            ),
            (height * 0.03).pdt,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(0),
                (width * 0.01).pdl,
                buildContainer(1),
                (width * 0.01).pdl,
                buildContainer(2),
              ],
            ),
            (height * 0.06).pdt,
            CustomText(
                text: index == 0
                    ? 'Find Food You Love'
                    : index == 1
                        ? 'Fast Delivery'
                        : 'Live Tracking',
                textcolor: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontsize: 25),
            (height * 0.04).pdt,
            CustomText(
                text: index == 0
                    ? 'Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep'
                    : index == 1
                        ? 'Fast food delivery to your home, ofiice\nwherever you are'
                        : 'Real time tracking of your food on the app\nonce you placed the orde'),
            (height * 0.06).pdt,
            CustomButton(
              text: 'Next',
              textColor: AppColors.mainWhiteColor,
              onPressed: () {
                Get.to(() => const HomeView());
                // setState(() {
                //   index == 2 ? index = 0 : index = index + 1;
                // });
              },
              paddingLR: width * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(int x) {
    return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                index == x ? AppColors.mainOrangeColor : AppColors.pointColor));
  }
}
