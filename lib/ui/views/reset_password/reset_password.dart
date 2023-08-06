import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: width * 0.1),
                child: Column(
                  children: [
                    (height * 0.06).pdt,
                    CustomText(
                        text: tr("Reset Password"),
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontsize: 25),
                    (height * 0.03).pdb,
                    CustomText(
                        text: tr("Please enter your email to receive a")),
                    CustomText(
                        text: tr("link to create a new password via email")),
                    (height * 0.06).pdb,
                    CustomTextField(
                        validator: (value) {
                          controller.validateEmail(value);
                          return null;
                        },
                        hinttext: tr("Email"),
                        mheight: height * 0.1,
                        mwidth: height * 0.8,
                        controller: controller.emailControlle),
                    (height * 0.04).pdb,
                    CustomButton(
                      onPressed: () {
                        controller.isValdiated();
                      },
                      text: tr("Send"),
                      textColor: AppColors.mainWhiteColor,
                      paddingLR: width * 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
