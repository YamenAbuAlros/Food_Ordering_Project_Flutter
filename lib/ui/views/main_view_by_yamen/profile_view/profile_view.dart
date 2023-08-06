import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodordering/core/enums/bottom_app_bar_items.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/home_view/home_view.dart';
import 'package:foodordering/ui/views/sign_up_view/sign_up_view.dart';

import '../../../shared/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      addressController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.04,
                  right: size.width * 0.05,
                  left: size.width * 0.05),
              child: Row(
                children: [
                  CustomText(
                      text: 'Profile',
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
                padding: EdgeInsets.only(
                    top: size.height * 0.04, bottom: size.height * 0.02),
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.13,
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
              padding: EdgeInsets.only(bottom: size.height * 0.013),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, color: AppColors.mainOrangeColor, size: 15),
                  CustomText(
                      text: 'Edit Profile',
                      textcolor: AppColors.mainOrangeColor,
                      fontsize: 10),
                ],
              ),
            ),
            Center(
              child: Text(
                'Hi there Emilia!',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: size.height * 0.06, top: size.aspectRatio * 0.005),
                child: Text(
                  'Sign Out',
                  style:
                      TextStyle(color: AppColors.secondaryColor, fontSize: 11),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: 'Emilia Clarke',
                // label: 'Name',
                controller: nameController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: 'emiliaclarke@email.com',
                // label: 'Email',
                controller: emailController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: 'emiliaclarke@email.com',
                // label: 'Mobile No',
                controller: mobileController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: 'No 23, 6th Lane, Colombo 03',
                // label: 'Address',
                controller: addressController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: '**************',
                // label: 'Password',
                controller: passwordController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: CustomTextField(
                // initValue: '**************',
                // label: 'Confirm Password',
                controller: confirmPasswordController,
                hinttext: '',
                mheight: size.height * 0.07,
                mwidth: size.width * 0.9,
              ),
            ),
            (size.height * 0.02).pdt,
            CustomButton(
              text: 'Save',
              textColor: AppColors.mainWhiteColor,
              paddingLR: size.width * 0.05,
            ),
            SizedBox(
              height: size.height * 0.17,
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomeView();
              }));
            },
            backgroundColor: AppColors.placeHolderColor,
            child: Icon(
              Icons.home,
              color: AppColors.mainWhiteColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar.showCustomBottomAppBar(context,
            bottomAppBarItems: BottomAppBarItems.PROFILE),
      ),
    );
  }
}
