import 'package:flutter/material.dart';
import 'package:foodordering/core/enums/bottom_navigation.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:get/get.dart';

class MainViewController extends BaseController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final drawerKey = GlobalKey<DrawerControllerState>();

  var selected = BottomNavigationEnum.HOME.obs;
  PageController controller = PageController(initialPage: 2);

  void animatedToPage(selectedEnum, pageNumber) {
    controller.animateToPage(
      pageNumber,
      duration: const Duration(
        microseconds: 500,
      ),
      curve: Curves.easeInCirc,
    );

    selected.value = selectedEnum;
  }
}
