import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/core/enums/image_type.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  XFile? choosedImage;

  XFile? ifChoose;
  final ImagePicker picker = ImagePicker();
  bool userChoose = false;
  FilePickerResult? result;
////////////////////////////////////////////
  bool isClicked = false;

///////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          (width * 0.1).sbh,
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: InkWell(
                  onTap: choosedImage == null && result == null
                      ? () {
                          showBottomSheet(context);
                          // setButtons(true);
                        }
                      : null,
                  child: CircleAvatar(
                    radius: width * 0.13,
                    backgroundColor: AppColors.placeHolderColor,
                    child: ClipOval(
                      child: choosedImage != null
                          ? Image.file(
                              File(choosedImage!.path),
                              fit: BoxFit.fill,
                            )
                          : result != null
                              ? const Icon(Icons.file_copy)
                              : null,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: choosedImage != null || result != null,
                child: Positioned(
                    left: width * 0.55,
                    child: InkWell(
                      onTap: () {
                        showBottomSheet(context);
                        // setButtons(true);
                      },
                      child: CircleAvatar(
                        radius: width * 0.05,
                        child: const Icon(Icons.edit),
                      ),
                    )),
              )
            ],
          ),
          (width * 0.1).sbh,
          // Visibility(
          //   visible: isClicked,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: CustomButton(
          //           text: 'Camera',
          //           textColor: AppColors.mainWhiteColor,
          //           paddingLR:    width * 0.05,
          //           onPressed: () async {
          //             await pikFile(ImageType.CAMERA);
          //           },
          //         ),
          //       ),
          //       Expanded(
          //         child: CustomButton(
          //           text: 'Gallery',
          //           textColor: AppColors.mainWhiteColor,
          //           paddingLR:    width * 0.05,
          //           onPressed: () async {
          //             await pikFile(ImageType.GALLERY);
          //           },
          //         ),
          //       ),
          //       Expanded(
          //         child: CustomButton(
          //           text: 'File',
          //           textColor: AppColors.mainWhiteColor,
          //           paddingLR:    width * 0.05,
          //           onPressed: () async {
          //             await pikFile(ImageType.FILE);
          //           },
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      )

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Stack(
          //       children: [
          //         Center(
          //           child: SizedBox(
          //             height:    height * 0.27,
          //             width:    width * 0.5,
          //             child: InkWell(
          //               onTap: choosedImage == null
          //                   ? () {
          //                       setState(() {
          //                         userChoose = true;
          //                       });
          //                     }
          //                   : null,
          //               child: CircleAvatar(
          //                 radius: 90,
          //                 backgroundImage: choosedImage == null
          //                     ? const AssetImage("assets/images/cam.jpg")
          //                     : Image.file(File(choosedImage!.path)).image,
          //               ),
          //             ),
          //           ),
          //         ),
          //         Positioned(
          //           height:    height * 0.47,
          //           left:    width * 0.62,
          //           child: Visibility(
          //             visible: choosedImage != null,
          //             child: InkWell(
          //                 onTap: () {
          //                   setState(() {
          //                     userChoose = true;
          //                   });
          //                 },
          //                 child: CircleAvatar(
          //                   backgroundColor: AppColors.mainOrangeColor,
          //                   child: const Icon(Icons.edit),
          //                 )),
          //           ),
          //         ),
          //       ],
          //     ),

          //     // Container(child: Icon(Icons.edit),)
          //     SizedBox(
          //       height:    height * 0.05,
          //     ),
          //     Visibility(
          //         visible: userChoose,
          //         child: CustomButton(
          //           paddingLR:    width * 0.05,
          //           text: "Camera",
          //           textColor: AppColors.mainWhiteColor,
          //           onPressed: () async {
          //             choosedImage =
          //                 await picker.pickImage(source: ImageSource.camera);
          //             setState(() {
          //               choosedImage == null
          //                   ? userChoose = true
          //                   : userChoose = false;
          //             });
          //           },
          //         )),
          //     SizedBox(
          //       height:    height * 0.05,
          //     ),
          //     Visibility(
          //         visible: userChoose,
          //         child: CustomButton(
          //           paddingLR:    width * 0.05,
          //           text: "Gallery",
          //           textColor: AppColors.mainWhiteColor,
          //           onPressed: () async {
          //             choosedImage =
          //                 await picker.pickImage(source: ImageSource.gallery);
          //             setState(() {
          //               choosedImage == null
          //                   ? userChoose = true
          //                   : userChoose = false;
          //             });
          //           },
          //         ))
          //   ],
          // ),
          ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: () async {
                await pikFile(ImageType.CAMERA);
              },
              leading: const Icon(Icons.camera_enhance),
              title: const Text('Camera'),
            ),
            ListTile(
              onTap: () async {
                await pikFile(ImageType.GALLERY);
              },
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
            ),
            ListTile(
              onTap: () async {
                await pikFile(ImageType.FILE);
              },
              leading: const Icon(Icons.file_open),
              title: const Text('File'),
            ),
          ],
        );
      },
    );
  }

  Future<void> pikFile(ImageType type) async {
    switch (type) {
      case ImageType.GALLERY:
        ifChoose = await picker.pickImage(source: ImageSource.gallery);
        if (ifChoose != null) choosedImage = ifChoose;
        break;
      case ImageType.CAMERA:
        ifChoose = await picker.pickImage(source: ImageSource.camera);
        if (ifChoose != null) choosedImage = ifChoose;
        break;
      case ImageType.FILE:
        result = await FilePicker.platform.pickFiles();
        if (result != null) choosedImage = null;
        break;
    }
    setState(() {});
    // setButtons(false);
    Get.back();
  }

  void setButtons(bool set) {
    setState(() {
      isClicked = set;
    });
  }
}
