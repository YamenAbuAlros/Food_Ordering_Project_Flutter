import 'package:flutter/material.dart';
import 'package:foodordering/core/enums/notification_type.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:get/get.dart';

class LandingController extends BaseController {
  Rx<Color> buttonColor = AppColors.mainOrangeColor.obs;
  @override
  void onInit() {
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.CHANGECOLOR.name) {
        buttonColor.value = AppColors.blueColor;
      }
    });
    super.onInit();
  }
}
