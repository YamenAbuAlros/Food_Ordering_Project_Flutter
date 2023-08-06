import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/main_view_controller.dart';
import 'package:foodordering/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:foodordering/ui/views/main_view/menu_view/menu_view.dart';
import 'package:foodordering/ui/views/main_view/profile_view/profile_view.dart';
import 'package:foodordering/ui/views/main_view/home_view/home_view.dart';
import 'package:get/get.dart';

import 'more_view/more_view.dart';
import 'offer_view/offers_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainViewController controller = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawerEnableOpenDragGesture: false,
      key: controller.scaffoldKey,
      drawer: Drawer(
        key: controller.drawerKey,
        backgroundColor: AppColors.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: width,
                alignment: Alignment.center,
                height: height * 0.03,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.mainOrangeColor),
                child: InkWell(
                  onTap: () {
                    controller.exitFromApp();
                  },
                  child: Text(
                    tr("Exit"),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.controller,
        children: const [
          MenuView(),
          OffersView(),
          HomeView(),
          ProfileView(),
          MoreView(),
        ],
      ),      
      bottomNavigationBar: Obx(() => BottomNavigationWidget(
        bottomNavigationEnum: controller.selected.value,
        onTap: (selectedEnum, pageNumber) {
          controller.animatedToPage(selectedEnum, pageNumber);
        },
      ),)
    );
  }
}
