import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import 'check_out_controller.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  void initState() {
    // storage.setOrderPlaced(true);
    super.initState();
  }

//*  -- i can use this instead of WillPopScope Widget But will not can handle Back Button --
  // @override
  // void dispose() {
  //   cartServices.clearCart();
  //   super.dispose();
  // }
//* ------
  CheckOutController controller = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cartServices.clearCart();
        Get.off(() => const MainView());
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CustomText(
                text:
                    'SubTotal : ${cartServices.subTotal.value.toStringAsFixed(2)}',
              ),
              Divider(height: height * 0.1),
              CustomText(
                text: 'Tax : ${cartServices.tax.value.toStringAsFixed(2)}',
              ),
              Divider(height: height * 0.1),
              CustomText(
                text:
                    'Delivary Fee : ${cartServices.deliverFees.value.toStringAsFixed(2)}',
              ),
              Divider(height: height * 0.1),
              CustomText(
                text: 'Total : ${cartServices.total.value.toStringAsFixed(2)}',
              ),
              Divider(height: height * 0.1),
              CustomButton(
                paddingLR: width * 0.05,
                textColor: AppColors.mainWhiteColor,
                text: 'Continue Shopping',
                onPressed: () {
                  cartServices.clearCart();
                  Get.off(() => const MainView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
