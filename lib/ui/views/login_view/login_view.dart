import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

import 'package:foodordering/ui/views/reset_password/reset_password.dart';
import 'package:foodordering/ui/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controllerLogin = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controllerLogin.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (height * 0.06).pdt,
              CustomText(
                  text: tr("key_login"),
                  textcolor: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontsize: width * 0.06),
              (height * 0.03).pdb,
              CustomText(
                  text: tr("Add your details to login"),
                  fontsize: width * 0.04),
              (height * 0.04).pdb,
              CustomTextField(
                  validator: (value) {
                    controllerLogin.validateEmail(value);
                    return null;
                  },
                  hinttext: tr("Your Email"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: controllerLogin.emailController),
              (height * 0.03).pdb,
              CustomTextField(
                  validator: (value) {
                    controllerLogin.validatePassword(value);
                    return null;
                  },
                  hinttext: tr("Password"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: controllerLogin.passwordController),
              (height * 0.03).pdb,
              Obx(
                () => controllerLogin.isLoading.value
                    ? SpinKitThreeBounce(
                        color: AppColors.mainOrangeColor,
                      )
                    : CustomButton(
                        text: tr("key_login"),
                        textColor: AppColors.mainWhiteColor,
                        onPressed: () async {
                          // locationService.getCurrentAddressInfo().then((value) {
                          //   value != null
                          //       ? CustomShowToast.showMessage(
                          //           message:
                          //               "Country:${value.country}\n Streat:${value.street}",
                          //           fontsize: width * 0.02,
                          //           messageType: MessageType.SUCCESS)
                          //       : CustomShowToast.showMessage(
                          //           message: "Check Error",
                          //           messageType: MessageType.REJECTED);
                          // });

                          controllerLogin.isValidate();
                        },
                        paddingLR: width * 0.1,
                      ),
              ),
              (height * 0.03).pdb,
              InkWell(
                child: CustomText(text: tr("Forgot your password?")),
                onTap: () {
                  Get.to(() => const ResetPasswordView());
                },
              ),
              (height * 0.06).pdb,
              CustomText(text: tr("or Login with")),
              (height * 0.03).pdb,
              CustomButton(
                text: tr("Login with Facebook"),
                imageName: 'facebook1',
                textColor: AppColors.mainWhiteColor,
                backgroundColor: AppColors.facebookColor,
                paddingLR: width * 0.1,
              ),
              (height * 0.03).pdb,
              CustomButton(
                text: tr("Login with Google"),
                imageName: 'google-plus-logo',
                textColor: AppColors.mainWhiteColor,
                backgroundColor: AppColors.googleColor,
                paddingLR: width * 0.1,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: tr("Don't have an Account? "),
                      fontsize: width * 0.05),
                  InkWell(
                      onTap: () => Get.to(() => const SignUpView()),
                      child: CustomText(
                          text: tr("Sign Up"),
                          textcolor: AppColors.mainOrangeColor,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
