import 'package:flutter/material.dart';
import 'package:foodordering/core/data/repositories/user_repositories.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController =
          TextEditingController(text: 'Test@gmail.com'),
      passwordController = TextEditingController(text: 'Test@1234');
  String passwordError = '';
  String emailError = '';

  RxBool isLoading = false.obs;

  isValidate() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepositoriey()
              .login(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
        value.fold((l) {
          isLoading.value = false;
          CustomShowToast.showMessage(
              messageType: MessageType.REJECTED, message: l);
        }, (r) {
          storage.setTokenIno(r);
          Get.off(() => const MainView());
        });
      }));
    }
  }

  // login() {
  // isLoading.value = true;
  //   UserRepositoriey()
  //       .login(email: emailController.text, password: passwordController.text)
  //       .then((value) {
  //     value.fold((l) {
  //       isLoading.value = false;
  //       CustomShowToast.showMessage(
  //           messageType: MessageType.REJECTED, message: l);
  //     }, (r) {
  //       storage.setTokenIno(r);
  //       Get.off(() => const MainView());
  //     });
  //   });
  // }
}
