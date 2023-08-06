import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/core/data/repositories/user_repositories.dart';
import 'package:foodordering/core/enums/image_type.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpContoller extends BaseController {
  TextEditingController firstNameController =
      TextEditingController(text: 'yamen');
  TextEditingController emailController =
      TextEditingController(text: 'yamnarooa@gmail.com');
  TextEditingController ageController = TextEditingController(text: '20');
  TextEditingController lastNameController =
      TextEditingController(text: 'Aboalroos');
  TextEditingController passwordController =
      TextEditingController(text: 'AAdd22##%');
  TextEditingController confirmPasswordController =
      TextEditingController(text: 'AAdd22##%');

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();
  bool userChoose = false;
  var sbar;
  XFile? choosedImage;
  XFile? ifchoosedImage;
  var tosendRequest;
  XFile? ifChoose;
  FilePickerResult? result;
////////////////////////////////////////////
  bool isClicked = false;
  var image;

  void showBottomSheetwithGetX() {
    Get.bottomSheet(
      Wrap(
        children: [
          ListTile(
            onTap: () async {
              await pikFile(ImageType.CAMERA);
            },
            leading: const Icon(Icons.camera_enhance),
            title: Text(tr("Camera")),
          ),
          ListTile(
            onTap: () async {
              await pikFile(ImageType.GALLERY);
            },
            leading: const Icon(Icons.photo),
            title: Text(tr("Gallery")),
          ),
          ListTile(
            onTap: () async {
              await pikFile(ImageType.FILE);
            },
            leading: const Icon(Icons.file_open),
            title: Text(tr("File")),
          ),
        ],
      ),
      backgroundColor: AppColors.mainWhiteColor,
    );
  }

  Future<void> pikFile(ImageType type) async {
    switch (type) {
      case ImageType.GALLERY:
        ifChoose = await picker.pickImage(source: ImageSource.gallery);
        if (ifChoose != null) {
          choosedImage = ifChoose;
          tosendRequest = choosedImage!.path;
        }
        break;
      case ImageType.CAMERA:
        ifChoose = await picker.pickImage(source: ImageSource.camera);
        if (ifChoose != null) {
          choosedImage = ifChoose;
          tosendRequest = choosedImage!.path;
        }
        break;
      case ImageType.FILE:
        result = await FilePicker.platform.pickFiles();

        if (result != null) {
          tosendRequest = result!.paths[0];
          choosedImage = null;
        }

        break;
    }
    update();

    Get.back();
  }

  String? validateFirstName(value) {
    if (value!.isEmpty) {
      return 'please enter your firstname';
    }
    if (!isName(value)) {
      return 'please check your firstname';
    }
    return null;
  }

  String? validateLastName(value) {
    if (value.isEmpty) {
      return 'please enter your lastname';
    }
    if (!isName(value)) {
      return 'please check your lastname';
    }
    return null;
  }

  String? validateAge(value) {
    if (value.isEmpty) {
      return 'please enter your age';
    }
    if (!isAge(value)) {
      return 'please check your age';
    }
    return null;
  }

  isValidate() {
    if (formkey.currentState!.validate()) {
      register();
      BotToast.showText(
          text: tr("Every Thing is ok"), contentColor: Colors.green);
    } else {
      BotToast.showText(
          text: tr("Some Thing is Wrong"), contentColor: Colors.red);
    }
  }

  void register() {
    UserRepositoriey()
        .Register(
      email: emailController.text,
      password: passwordController.text,
      age: int.parse(ageController.text),
      photo: tosendRequest,
      lastname: lastNameController.text,
      firstname: firstNameController.text,
    )
        .then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            messageType: MessageType.REJECTED, message: l);
      }, (r) {
        CustomShowToast.showMessage(
            messageType: MessageType.SUCCESS, message: "Every Thing is Ok");
        Get.off(() => const MainView());
      });
    });
  }
}
