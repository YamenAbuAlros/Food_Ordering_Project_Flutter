import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/login_view/login_view.dart';
import 'package:foodordering/ui/views/sign_up_view/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpContoller signUpController = Get.put(SignUpContoller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: signUpController.formkey,
          child: SingleChildScrollView(
            child: Column(children: [
              (height * 0.04).pdt,
              CustomText(
                  text: tr("Sign Up"),
                  textcolor: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontsize: 25),
              (height * 0.02).pdb,
              CustomText(text: tr("Add your details to sign up"), fontsize: 16),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              GetBuilder<SignUpContoller>(
                init: SignUpContoller(),
                builder: (controller) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: controller.choosedImage == null &&
                                controller.result == null
                            ? () {
                                signUpController.showBottomSheetwithGetX();
                              }
                            : null,
                        child: CircleAvatar(
                          radius: width * 0.13,
                          backgroundColor: AppColors.placeHolderColor,
                          child: ClipOval(
                            child: controller.choosedImage != null
                                ? Image.file(
                                    File(controller.choosedImage!.path),
                                    fit: BoxFit.fill,
                                  )
                                : controller.result != null
                                    ? const Icon(Icons.file_copy)
                                    : null,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.choosedImage != null ||
                          controller.result != null,
                      child: Positioned(
                          left: width * 0.55,
                          child: InkWell(
                            onTap: () {
                              signUpController.showBottomSheetwithGetX();
                            },
                            child: CircleAvatar(
                              radius: width * 0.05,
                              child: const Icon(Icons.edit),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              (height * 0.03).sbh,
              CustomTextField(
                  validator: (value) {
                    signUpController.validateFirstName(value);
                    return null;
                  },
                  hinttext: tr("FirstName"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.firstNameController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomTextField(
                  validator: (value) {
                    signUpController.validateLastName(value);
                    return null;
                  },
                  hinttext: tr("LastName"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.lastNameController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomTextField(
                  validator: (value) {
                    signUpController.validateAge(value);
                    return null;
                  },
                  hinttext: tr("Age"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.ageController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomTextField(
                  validator: (value) {
                    signUpController.validateEmail(value);
                    return null;
                  },
                  hinttext: tr("Email"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.emailController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomTextField(
                  validator: (value) {
                    signUpController.validatePassword(value);
                    return null;
                  },
                  hinttext: tr("Password"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.passwordController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomTextField(
                  validator: (value) {
                    signUpController.validateConfirmPassword(value,
                        signUpController.confirmPasswordController.value);
                    return null;
                  },
                  hinttext: tr("Confirm Password"),
                  mheight: height * 0.1,
                  mwidth: width * 0.8,
                  controller: signUpController.confirmPasswordController),
              (height * 0.014).pdt,
              (height * 0.014).pdb,
              CustomButton(
                text: tr("Sign Up"),
                textColor: AppColors.mainWhiteColor,
                onPressed: () {
                  signUpController.isValidate();
                },
                paddingLR: width * 0.1,
              ),
              (height * 0.14).pdt,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: tr("Already have an Account? "), fontsize: 16),
                  InkWell(
                    onTap: () => Get.to(() => const LoginView()),
                    child: CustomText(
                        text: tr("Login"),
                        textcolor: AppColors.mainOrangeColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
