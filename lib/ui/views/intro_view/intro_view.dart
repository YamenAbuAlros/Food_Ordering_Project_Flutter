import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/intro_view/intro_controller.dart';
import 'package:foodordering/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => Column(
                children: [
                  (height * 0.1).pdt,
                  SvgPicture.asset(
                    'assets/images/intro${controller.currentindex.value}.svg',
                    fit: BoxFit.fill,
                    width: width,
                    height: height * 0.4,
                  ),
                  (height * 0.04).pdt,
                  DotsIndicator(
                    dotsCount: 3,
                    position: controller.currentindex.value.toDouble(),
                    decorator: DotsDecorator(
                      color: AppColors.pointColor, // Inactive color
                      activeColor: AppColors.mainOrangeColor,
                    ),
                  ),
                  (height * 0.06).pdt,
                  CustomText(
                      text: controller.titleList[controller.currentindex.value],
                      textcolor: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontsize: width * 0.07),
                  (height * 0.04).pdt,
                  Text(
                    controller.descriptionList[controller.currentindex.value],
                    textAlign: TextAlign.center,
                  ),
                  (height * 0.06).pdt,
                  CustomButton(
                    text: controller.currentindex.value != 2
                        ? tr("Next")
                        : tr("Finish"),
                    paddingLR: width * 0.1,
                    textColor: AppColors.mainWhiteColor,
                    onPressed: () {
                      controller.currentindex.value != 2
                          ? controller.incrementIndex()
                          : Get.off(() => LandingView());
                    },
                  ),
                ],
              ))),
    );
  }
}
