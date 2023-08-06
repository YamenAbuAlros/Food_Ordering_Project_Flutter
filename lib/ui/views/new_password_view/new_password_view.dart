import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/new_password_view/new_password_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  NewPasswordController controller = Get.put(NewPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsetsDirectional.only(start: width * 0.1, end: width * 0.1),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                (height * 0.06).pdt,
                CustomText(
                    text: tr("New Password"),
                    textcolor: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontsize: 25),
                (height * 0.03).pdb,
                CustomText(text: tr("Please enter your email to receive a")),
                CustomText(text: tr("link to create a new password via email")),
                (height * 0.03).pdb,
                CustomTextField(
                    validator: (value) {
                      controller.validatePassword(value);
                      return null;
                    },
                    hinttext: tr("New Password"),
                    mheight: height * 0.1,
                    mwidth: height * 0.8,
                    controller: controller.newPasswordController),
                (height * 0.03).pdb,
                CustomTextField(
                    validator: (value) {
                      controller.validateConfirmPassword(
                          value, controller.confirmPassswordController);
                      return null;
                    },
                    hinttext: tr("Confirm Password"),
                    mheight: height * 0.1,
                    mwidth: height * 0.8,
                    controller: controller.confirmPassswordController),
                (height * 0.03).pdb,
                CustomButton(
                  text: tr("Next"),
                  textColor: AppColors.mainWhiteColor,
                  onPressed: () {
                    controller.isValidated();
                  },
                  paddingLR: width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
