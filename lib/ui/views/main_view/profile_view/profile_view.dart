import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/profile_view/profile_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: height * 0.04, end: width * 0.05, start: width * 0.05),
          child: Row(
            children: [
              CustomText(
                  text: tr("Profile"),
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  textcolor: AppColors.primaryColor),
              const Spacer(),
              const CustomSvgPicture(imagename: 'shopping-cart'),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: height * 0.04, bottom: height * 0.02),
            child: SizedBox(
              width: width * 0.3,
              height: height * 0.13,
              child: const CircleAvatar(
                backgroundImage: (AssetImage(
                  'assets/images/user.png',
                )),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(Icons.camera_alt)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: height * 0.013),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: AppColors.mainOrangeColor, size: 15),
              CustomText(
                  text: tr("Edit Profile"),
                  textcolor: AppColors.mainOrangeColor,
                  fontsize: 10),
            ],
          ),
        ),
        Center(
          child: CustomText(
            text: tr("Hi there Emilia!"),
            fontsize: 16,
            textcolor: AppColors.primaryColor,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: height * 0.06, top: height * 0.005),
            child: InkWell(
              onTap: controller.exitFromApp,
              child: CustomText(
                text: tr("Sign Out"),
                fontsize: 11,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            label: tr("Name"),
            controller: controller.nameController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            // initValue: 'emiliaclarke@email.com',
            label: tr("Email"),
            controller: controller.emailController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            label: tr("Mobile No"),
            controller: controller.mobileController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            // initValue: 'No 23, 6th Lane, Colombo 03',
            label: tr("Address"),
            controller: controller.addressController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            // initValue: '**************',
            label: tr("Password"),
            controller: controller.passwordController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: CustomTextField(
            // initValue: '**************',
            label: tr("Confirm Password"),
            controller: controller.confirmPasswordController,
            hinttext: '',
            mheight: height * 0.07,
            mwidth: width * 0.9,
          ),
        ),
        (height * 0.02).pdt,
        CustomButton(
          text: tr("Save"),
          textColor: AppColors.mainWhiteColor,
          paddingLR: width * 0.05,
        ),
        (height * 0.17).sbh,
      ]),
    );
  }
}
