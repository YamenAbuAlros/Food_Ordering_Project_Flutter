  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodordering/core/data/models/apis/meal_model.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/meal_details_controller.dart';
import 'package:get/get.dart';

class MealDetailsView extends StatefulWidget {
  const MealDetailsView({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late MealDetailsController controller;

  @override
  void initState() {
    controller = Get.put(MealDetailsController(widget.mealModel));
    super.initState();
  }

  // MealDetailsController controller = Get.put(MealDetailsController());
  // @override
  // void initState() {
  //   controller.setMealModel = widget.mealModel;

  //   super.initState();
  // }
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            Stack(
              children: [
                // Image.asset('assets/images/f2.jpg',
                //     alignment: Alignment.topCenter, height: height),

                Container(
                  padding: EdgeInsetsDirectional.only(top: height * 0.02),
                  height: height,
                  alignment: AlignmentDirectional.topCenter,
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    // width: width,

                    placeholder: (context, url) => CircularProgressIndicator(
                      color: AppColors.mainOrangeColor,
                      strokeWidth: 2,
                    ),
                    imageUrl: getFullImageUrl(widget.mealModel.images![0]),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: height * 0.04,
                      start: width * 0.05,
                      end: width * 0.05),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      CustomSvgPicture(
                        imagename: 'left_arrow',
                        width: width * 0.08,
                        color: AppColors.mainOrangeColor,
                      ),
                      (width * 0.72).sbw,
                      CustomSvgPicture(
                        imagename: 'shopping-cart',
                        color: AppColors.mainOrangeColor,
                        width: width * 0.08,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: height * 0.3),
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                        top: width * 0.06,
                        start: width * 0.06,
                        end: width * 0.06),
                    decoration: BoxDecoration(
                        color: AppColors.mainWhiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.1),
                            topRight: Radius.circular(width * 0.1))),
                    width: width,
                    height: height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CustomText(text: "${controller.mealModel.name}"),
                        CustomText(
                            text: "${widget.mealModel.name}",
                            fontsize: width * 0.06,
                            textcolor: AppColors.primaryColor),
                        Row(
                          textDirection: TextDirection.ltr,
                          children: const [
                            CustomSvgPicture(imagename: 'star'),
                            CustomSvgPicture(imagename: 'star'),
                            CustomSvgPicture(imagename: 'star'),
                            CustomSvgPicture(imagename: 'star'),
                            CustomSvgPicture(
                              imagename: 'starBlank',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: '4 Star Ratings',
                                textcolor: AppColors.mainOrangeColor),
                            const Spacer(),
                            CustomText(
                                text: 'Rs. ${widget.mealModel.price}',
                                fontsize: width * 0.08,
                                textcolor: AppColors.primaryColor),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            CustomText(
                                text: "/ per Portion",
                                textcolor: AppColors.primaryColor),
                          ],
                        ),
                        CustomText(
                            text: "Description",
                            fontWeight: FontWeight.bold,
                            fontsize: width * 0.04,
                            textcolor: AppColors.primaryColor),
                        // CustomText(text: "${controller.mealModel.description}"),
                        CustomText(
                            textcolor: AppColors.primaryColor,
                            text: "${widget.mealModel.description}"),
                        (height * 0.04).sbh,
                        Divider(
                          thickness: width * 0.005,
                        ),
                        CustomText(
                            text: "Customize your Order",
                            fontWeight: FontWeight.bold,
                            fontsize: width * 0.04,
                            textcolor: AppColors.primaryColor),
                        (height * 0.03).sbh,
                        //!dropdown Start 1
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsetsDirectional.only(
                                    start: width * 0.07, end: width * 0.02),
                                fillColor: AppColors.pointColor,
                                constraints:
                                    BoxConstraints(maxHeight: height * 0.07),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.pointColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.01)))),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primaryColor,
                            ),
                            hint: CustomText(
                              textcolor: AppColors.primaryColor,
                              text: controller.dropdownvalue1,
                            ),
                            // disabledHint: const Text('Sele'),
                            value: controller.dropdownvalue1,
                            elevation: 2,
                            isExpanded: true,
                            items: controller.items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                controller.dropdownvalue1 = value as String;
                              });
                            }),
                        (height * 0.02).sbh,
                        //!dropdown Start 2
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsetsDirectional.only(
                                    end: width * 0.02, start: width * 0.07),
                                fillColor: AppColors.pointColor,
                                constraints:
                                    BoxConstraints(maxHeight: height * 0.07),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.pointColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.01)))),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primaryColor,
                            ),
                            hint: CustomText(
                              text: controller.dropdownvalue2,
                              textcolor: AppColors.primaryColor,
                            ),
                            // disabledHint: const Text('Sele'),
                            value: controller.dropdownvalue2,
                            elevation: 2,
                            isExpanded: true,
                            items: controller.items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                controller.dropdownvalue2 = value as String;
                              });
                            }),
                        //!dropdown End 2
                        (height * 0.03).sbh,
                        Row(
                          children: [
                            CustomText(
                                text: "Number of Portions",
                                fontWeight: FontWeight.bold,
                                fontsize: width * 0.04,
                                textcolor: AppColors.primaryColor),
                            const Spacer(),
                            Obx(
                              () => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          Size(width * 0.13, height * 0.05),
                                      shape: const StadiumBorder(),
                                      backgroundColor:
                                          AppColors.mainOrangeColor),
                                  onPressed: controller.count > 1
                                      ? () {
                                          controller.changeCount(false);
                                        }
                                      : null,
                                  child: const Text("-")),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.01, end: width * 0.01),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          Size(width * 0.13, height * 0.05),
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color:
                                                  AppColors.mainOrangeColor)),
                                      disabledBackgroundColor:
                                          AppColors.mainWhiteColor),
                                  onPressed: null,
                                  child: Obx(
                                    () => CustomText(
                                      text: "${controller.count.value}",
                                      textcolor: AppColors.mainOrangeColor,
                                    ),
                                  )),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        Size(width * 0.13, height * 0.05),
                                    shape: const StadiumBorder(),
                                    backgroundColor: AppColors.mainOrangeColor),
                                onPressed: () {
                                  controller.changeCount(true);
                                },
                                child: const Text("+")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: height * 0.92),
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.22,
                    decoration: BoxDecoration(
                      color: AppColors.mainOrangeColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(width * 0.12),
                        topRight: Radius.circular(width * 0.12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: height * 0.95,
                      bottom: height * 0.1,
                      start: width * 0.15),
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      start: width * 0.07,
                      end: width * 0.07,
                      top: width * 0.037,
                    ),
                    width: width * 0.7,
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      color: AppColors.mainWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.12),
                        bottomLeft: Radius.circular(width * 0.12),
                      ),
                    ),
                    child: Obx(
                      () => Column(
                        children: [
                          const CustomText(text: 'Total Price'),
                          CustomText(
                              fontWeight: FontWeight.bold,
                              textcolor: AppColors.primaryColor,
                              fontsize: width * 0.055,
                              text: "LKR ${controller.calcTotal()}"),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrangeColor,
                                shape: const StadiumBorder(),
                                minimumSize: Size(width * 0.0, height * 0.05),
                              ),
                              onPressed: () {
                                controller.addToCart();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomSvgPicture(
                                    imagename: 'shopping-cart',
                                    color: AppColors.mainWhiteColor,
                                  ),
                                  CustomText(
                                    text: "Add to Cart",
                                    textcolor: AppColors.mainWhiteColor,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: height * 0.99, start: width * 0.78),
                  child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.05),
                      width: width * 0.15,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: AppColors.mainWhiteColor,
                      ),
                      child: const CustomSvgPicture(
                        imagename: 'shopping-cart',
                      )),
                ),
                PositionedDirectional(
                  end: width * 0.08,
                  top: height * 0.27,
                  child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.05),
                      width: width * 0.15,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: AppColors.mainWhiteColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/heart.svg',
                      )),
                ),

                // Text('${widget.mealModel.description}'),
                // ElevatedButton(
                //     onPressed: () {
                //       controller.changeCount(true);
                //     },
                //     child: const Text('+')),
                // Obx(
                //   () => ElevatedButton(
                //       onPressed: null, child: Text("${controller.count.value}")),
                // ),
                // Obx(
                //   () => ElevatedButton(
                //       onPressed: controller.count.value > 1
                //           ? () {
                //               controller.changeCount(false);
                //               controller.color.value = AppColors.mainOrangeColor;
                //             }
                //           : null,
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: controller.color.value),
                //       child: const Text('-')),
                // ),
                // Obx(
                //   () => Text(
                //       "The Total Price :${controller.calcTotalPrice(widget.mealModel.price)}"),
                // ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

//!From coach
