import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/views/screen_details/screen_details_view.dart';
import 'package:get/get.dart';

class NewPasswordController extends BaseController {
  TextEditingController newPasswordController = TextEditingController(),
      confirmPassswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  isValidated() {
    if (formKey.currentState!.validate()) {
      Get.to(() => const ScreenDetailsView());
    } else {
      BotToast.showText(
          text: tr("Some Thing is Wrong"), contentColor: Colors.red);
    }
  }
}
