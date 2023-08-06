import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  int len = 4;
  String otp = '';

  RxBool isVerified = false.obs;
  TextEditingController starController = TextEditingController();

  void changeTo(String value1, BuildContext context, int value) {
    otp += value1;
    FocusScope.of(context).nextFocus();
    if (value == len - 1) {
      //here we can add verification

      CustomShowToast.showMessage(
        message: 'The Otp code is\n$otp',
      );
      //here i can add condition if the value returned from api is true which means the value enter from user same the code;
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) {
      //   return const NewPasswordView();
      // }));
    }
  }
}
