import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/cart_view/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: controller.cartList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.cartList[index].meal!.name ?? '',
                            style: TextStyle(fontSize: screenWidth(10)),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.removeFromCartList(
                                  controller.cartList[index]);
                            },
                            icon: const Icon(Icons.delete),
                            color: AppColors.mainOrangeColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            heightSize: height * 0.07,
                            widthSize: width * 0.2,
                            text: '+',
                            onPressed: () {
                              controller.changeCount(
                                  incress: true,
                                  model: controller.cartList[index]);
                            },
                            paddingLR: width * 0.01,
                            textColor: AppColors.mainWhiteColor,
                          ),
                          Text(controller.cartList[index].count.toString(),
                              style: TextStyle(fontSize: width * 0.1)),
                          CustomButton(
                            heightSize: height * 0.07,
                            widthSize: width * 0.2,
                            textColor: AppColors.mainWhiteColor,
                            text: '-',
                            onPressed: controller.cartList[index].count! > 1
                                ? () {
                                    controller.changeCount(
                                        incress: false,
                                        model: controller.cartList[index]);
                                  }
                                : null,
                            paddingLR: width * 0.01,
                          ),
                        ],
                      ),
                      Text(
                          "Total:   ${controller.cartList[index].total.toString()}",
                          style: TextStyle(fontSize: screenWidth(10))),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.mainOrangeColor,
                    height: height * 0.01,
                  );
                },
              );
            }),
            Divider(
              color: AppColors.mainOrangeColor,
              height: height * 0.01,
            ),
            (height * 0.03).sbh,
            Center(
                child: CustomText(
              text: "Cart Data",
              fontWeight: FontWeight.bold,
              fontsize: width * 0.06,
              textcolor: AppColors.greenColor,
            )),
            Padding(
                padding: EdgeInsetsDirectional.only(
                  start: width * 0.07,
                  top: height * 0.03,
                  end: width * 0.07,
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: "Sub Total :",
                              textcolor: AppColors.primaryColor),
                          CustomText(
                              text: cartServices.subTotal.toStringAsFixed(3),
                              textcolor: AppColors.primaryColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: "Tax :", textcolor: AppColors.primaryColor),
                          CustomText(
                              text: cartServices.tax.toStringAsFixed(3),
                              textcolor: AppColors.primaryColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: "Delivery Fee :",
                              textcolor: AppColors.primaryColor),
                          CustomText(
                              text: cartServices.deliverFees.toStringAsFixed(3),
                              textcolor: AppColors.primaryColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: "Total Sum:",
                              textcolor: AppColors.primaryColor),
                          CustomText(
                              text: cartServices.total.toStringAsFixed(3),
                              textcolor: AppColors.primaryColor),
                        ],
                      ),
                    ],
                  ),
                )),
            (height * 0.1).sbh,
            CustomButton(
              text: "Check_Out",
              textColor: AppColors.mainWhiteColor,
              paddingLR: width * 0.05,
              onPressed: () {
                controller.checkout();
              },
            )
          ],
        ),
      )),
    );
  }
}
