import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/views/verification_code_view/verication_code_view.dart';
import 'package:get/get.dart';

class ResetPasswordController extends BaseController {
  TextEditingController emailControlle = TextEditingController();
  final formKey = GlobalKey<FormState>();

  isValdiated() {
    if (formKey.currentState!.validate()) {
      Get.to(() => const OtpView());
    } else {
      BotToast.showText(text: tr("Some Thing is Wrong"));
    }
  }
}
