import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/new_password_view/new_password_view.dart';
import 'package:foodordering/ui/views/verification_code_view/verification_code_controller.dart';
import 'package:get/get.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  VerificationCodeController controller = Get.put(VerificationCodeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            (height * 0.06).pdt,
            CustomText(
                text: tr("We have sent an OTP to"),
                textcolor: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontsize: 25),
            CustomText(
                text: tr("your Mobile"),
                textcolor: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontsize: 25),
            (height * 0.03).pdb,
            CustomText(text: tr("Please check your mobile number 071*****12")),
            CustomText(text: tr("continue to reset your password")),
            (height * 0.06).pdb,
            // PinCodeTextField(
            //   controller: controller.starController,
            //   appContext: context,
            //   length: 4,
            //   onChanged: (value) {},
            //   hintCharacter: '*',
            //   obscureText: true,
            //   animationType: AnimationType.fade,
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   pinTheme: PinTheme(
            //     disabledColor: AppColors.placeHolderColor,
            //     inactiveColor: AppColors.textFormFieldColor,
            //     shape: PinCodeFieldShape.box,
            //     borderRadius: BorderRadius.circular(width * 0.05),
            //     fieldHeight: height * 0.07,
            //     fieldWidth: width * 0.15,
            //   ),
            //   onCompleted: (value) {
            //? Here We can add condition for verification

            //     controller.isVerified.value = true;
            //     CustomShowToast.showMessage(
            //       message: '${tr("The Otp code is")}\n$value',
            //     );
            //   },
            // ),
            //! This was practice with AbdulRahman
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(controller.len, (value) {
                return TextFormField(
                  autofocus: true,
                  obscureText: true,
                  obscuringCharacter: '*',
                  onChanged: (value1) {
                    controller.changeTo(value1, context, value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFormFieldColor,
                    constraints: BoxConstraints(
                      maxWidth: width * 0.15,
                      maxHeight: height * 0.2,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: width * 0.03, horizontal: width * 0.03),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        borderSide:
                            BorderSide(color: AppColors.mainWhiteColor)),
                  ),
                );
              }),
            ),
            (height * 0.04).pdb,
            CustomButton(
              text: tr("Next"),
              textColor: AppColors.mainWhiteColor,
              onPressed: () {
                controller.isVerified.value
                    ? Get.to(() => const NewPasswordView())
                    : null;
              },
              paddingLR: width * 0.1,
            ),
            (height * 0.04).pdb,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: tr("Didn't Receive? "), fontsize: 14),
                InkWell(
                  child: CustomText(
                      text: tr("Click Here"),
                      textcolor: AppColors.mainOrangeColor,
                      fontWeight: FontWeight.bold,
                      fontsize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
