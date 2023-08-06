import 'package:foodordering/core/data/models/apis/category_model.dart';
import 'package:foodordering/core/data/models/apis/meal_model.dart';
import 'package:foodordering/core/data/repositories/category_repositertes.dart';
import 'package:foodordering/core/data/repositories/meal_repositories.dart';
import 'package:foodordering/core/enums/connectivity_status.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/enums/operation_type.dart';
import 'package:foodordering/core/enums/request_status.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/core/utilis/network_utilis.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:foodordering/ui/shared/utils.dart';

import 'package:get/get.dart';

class HomeViewController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;
  RxInt cartCount = cartServices.getCartCount().obs;

  RxBool isOnline = true.obs;
  RxInt numberOfNotifications = 0.obs;

  @override
  onInit() async {
    getAllCategory();
    getALlMeal();
    checkConnection();
    numberOfNotifications.value = storage.getNumberOfNotifications();
    super.onInit();
  }

  void checkConnection() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      // setIsOnline = event;
      print("Connection From HomeViewController Changed To $event");
      isOnline.value = event == ConnectivityStatus.ONLINE;
    });

    notificationService.notifcationStream.stream.listen((event) {
      numberOfNotifications.value += 1;
      storage.setNumberOfNotifications(numberOfNotifications.value);
    });
  }

  bool get isCategoryLoading =>
      operationType['CATEGORY'] == OperationType.CATEGORY &&
      status.value == RequestStatus.LOADING;

  bool get isMealLoading =>
      operationType["MEAL"] == OperationType.MEAL &&
      status.value == RequestStatus.LOADING;

  void addToCart(MealModel model) {
    cartServices.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CustomShowToast.showMessage(
              message:
                  "One serving of ${model.name} has been added to the cart",
                  
              messageType: MessageType.SUCCESS);
        });

    // cartCount.value = cartCount.value + 1;
  }

  void getAllCategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function:
            CategoryRepositiers().getAll().then((value) => value.fold((l) {
                  CustomShowToast.showMessage(
                      message: l, messageType: MessageType.REJECTED);
                  status.value = RequestStatus.ERROR;
                }, (r) {
                  categoryList.addAll(r);
                  status.value = RequestStatus.SUCCESS;
                })));
  }

  void getALlMeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepositiers().getAll().then((value) => value.fold((l) {
              CustomShowToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
              //  ? if You Need Can Use This condition
              status.value = RequestStatus.ERROR;
            }, (r) {
              mealList.addAll(r);
              status.value = RequestStatus.SUCCESS;
            })));
  }

  String getFullImageUrl(String url) {
    var splitedString = url.split('Images/');
    return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
  }

  void searchFood(String text) {
    final categoryBySearch = categoryList.where((element) {
      final categoryName = element.name!.toLowerCase();
      final input = text.toLowerCase();
      return categoryName.contains(input);
    }).toList();
    if (text == "") {
      // allCategoriesListForSerach.addAll(allCategoriesList);
    } else {
      // allCategoriesListForSerach.addAll(categoryBySearch);
    }
  }

//! From Coach ---

  // bool get isCategoryLoading =>
  //     operationType.value.contains(OperationType.CATEGORY) &&
  //     status.value == RequestStatus.LOADING;

  // bool get isMealLoading =>
  //     operationType.value.contains(OperationType.MEAL) &&
  //     status.value == RequestStatus.LOADING;
}
