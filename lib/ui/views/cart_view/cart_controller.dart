import 'package:foodordering/core/data/models/apis/cart_model.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/check_out_view/check_out_view.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = <CartModel>[].obs;
  // RxList<CartModel> cartList = cartServices.cartList;

  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble deliveryFee = 0.0.obs;
  RxDouble totalSum = 0.0.obs;

  @override
  void onInit() {
    cartList.value = storage.getCartList();
    
    super.onInit();
  }

  void removeFromCartList(CartModel model) {
    cartServices.removeFromCartList(model: model);
    cartList.value = cartServices.cartList;
  }

  void changeCount({required bool incress, required CartModel model}) {
    cartServices.changeCount(incress: incress, model: model);
    cartList.value = cartServices.cartList;
  }

  void checkout() {
    runFullLoadingFutureFunction(
      function: Future.delayed(
        const Duration(seconds: 2),
      ),
    ).then((value) {
      Get.off(() => const CheckOutView());
    });
  }
  
  // void calcCartTotal() {
  //   subTotal.value = 0;

  //   for (var element in cartList) {
  //     subTotal.value = subTotal.value + element.total!;
  //   }

  //   tax.value = subTotal.value * taxAmount;
  //   deliveryFee.value = (subTotal.value + tax.value) * deliveryAmount;
  //   totalSum.value = subTotal.value + deliveryFee.value + tax.value;
  // }

  // void calcTotal() {
  //   // Map<String, double> result = cartServices.calcTotals();
  //   subTotal.value = result["subTotal"]!;
  //   tax.value = result["tax"]!;
  //   deliveryFee.value = result["deliverFees"]!;
  //   totalSum.value = result["total"]!;
  // }
}

 

 



  

  //!---- First -----

  // RxDouble subTotal = 0.0.obs;
  // RxDouble tax = 0.0.obs;
  // RxDouble deliverFees = 0.0.obs;
  // RxDouble total = 0.0.obs;

  // void calcCartTotal() {
  //   subTotal.value = 0.0;
  //   tax.value = 0.0;
  //   deliverFees.value = 0.0;
  //   total.value = 0.0;

  //   subTotal.value = cartList.fold(
  //       0, (previousValue, element) => previousValue + element.total!);
  //   tax.value += subTotal.value * taxAmount;
  //   deliverFees.value += (subTotal.value + tax.value) * deliveryFeesAmount;
  //   total.value = subTotal.value + deliverFees.value + tax.value;
  // }

  // //!--- Second -----
  // double calcSubTotal() {
  //   return cartService.calcCartSubTotal();
  // }

  // double calcTax() {
  //   return cartService.calcCartTax();
  // }

  // double calcDeliveryFees() {
  //   return cartService.calcCartDeliveryFees();
  // }

  // double calcTotal() {
  //   return cartService.calcCartTotal();
  // }

  // void calcTotals() {
  //   calcSubTotal();
  //   calcTax();
  //   calcDeliveryFees();
  //   calcTotal();
  // }

  // //!--- Third ----
  // Map<String, double> calcTotals() {
  //   double subTotal = 0.0;
  //   double tax = 0.0;
  //   double deliverFees = 0.0;
  //   double total = 0.0;

  //   cartList.forEach((element) {
  //     subTotal += element.total ?? 0.0;
  //   });
  //   tax += subTotal * taxAmount;
  //   deliverFees += (subTotal + tax) * deliverAmount;
  //   total = subTotal + deliverFees + tax;

  //   return {
  //     "subTotal": subTotal,
  //     "tax": tax,
  //     "deliverFees": deliverFees,
  //     "total": total
  //   };
  // }

