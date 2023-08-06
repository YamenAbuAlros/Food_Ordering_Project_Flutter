import 'package:foodordering/core/data/models/apis/meal_model.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/cart_view/cart_view.dart';
import 'package:foodordering/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:get/get.dart';

class MealDetailsController extends BaseController {
  MealDetailsController(MealModel mealModel) {
    model = mealModel;
  }

  RxDouble rating = 0.0.obs;

  MealModel model = MealModel();
  RxInt count = 1.obs;
  var color = AppColors.mainWhiteColor.obs;
  String dropdownvalue1 = '- Select the size of portion -';

  String dropdownvalue2 = '- Select the ingredients -';
  var items = [];

  set setMealModel(mealModel) {
    mealModel = mealModel;
  }

  changeCount(bool increase) {
    if (increase) {
      count++;
    } else {
      if (count > 1) {
        count--;
      }
    }
  }

//!

  void addToCart() {
    cartServices.addToCart(
        model: model,
        count: count.value,
        //  afterAdd: () {
        //         Get.to(() => CartView());
        //       },
        afterAdd: () async {
          var result = await Get.to(const CartView());

          Get.find<HomeViewController>().cartCount.value =
              cartServices.getCartCount();
        });
  }

//!
  double calcTotal() {
    return cartServices.calcMealTotal(
      model: model,
      count: count.value,
    );
  }
}
