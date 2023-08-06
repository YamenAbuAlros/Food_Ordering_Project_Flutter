import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodordering/core/data/models/apis/category_model.dart';
import 'package:foodordering/core/data/models/apis/meal_model.dart';
import 'package:foodordering/core/data/repositories/category_repositertes.dart';
import 'package:foodordering/core/data/repositories/meal_repositories.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/utilis/network_utilis.dart';
import 'package:foodordering/ui/custom/custom_category_item.dart';
import 'package:foodordering/ui/custom/custom_popular_item.dart';
import 'package:foodordering/ui/custom/custom_recent_item.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_heading.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_resaturant_items.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/utils.dart';

class HomeViewTest extends StatefulWidget {
  const HomeViewTest({super.key});

  @override
  State<HomeViewTest> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeViewTest> {
  List<CategoryModel> categoryList = [];
  bool loaded = false;

  List<MealModel> mealList = [];
  late Future<List<dynamic>> futureMethods;
  String getFullImageUrl(String url) {
    var splitedString = url.split('Images/');
    return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
  }

  @override
  void initState() {
    futureMethods = Future.wait(
        [CategoryRepositiers().getAll(), MealRepositiers().getAll()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureMethods,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data![0] != null) {
              snapshot.data![0].fold((l) {
                CustomShowToast.showMessage(
                    message: l, messageType: MessageType.REJECTED);
              }, (r) {
                categoryList.clear();
                categoryList.addAll(r);
              });
            }
            if (snapshot.data![1] != null) {
              snapshot.data![1].fold((l) {
                CustomShowToast.showMessage(
                    message: l, messageType: MessageType.REJECTED);
              }, (r) {
                mealList.clear();
                mealList.addAll(r);
              });
            }
          }
          return snapshot.connectionState != ConnectionState.done
              ? SpinKitThreeBounce(
                  color: AppColors.mainOrangeColor,
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.05, left: width * 0.05),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'Good morning Akila!',
                              fontsize: width * 0.049,
                              fontWeight: FontWeight.bold,
                              textcolor: AppColors.primaryColor,
                            ),
                            SizedBox(width: width * 0.35),
                            const CustomSvgPicture(imagename: 'shopping-cart'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.03,
                            // right:    width * 0.75,
                            left: width * 0.05),
                        child: CustomText(
                            text: 'Delivering to',
                            fontsize: width * 0.029,
                            textcolor: AppColors.placeHolderColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.05,
                        ),
                        child: CustomText(
                            text: 'Current Location',
                            fontsize: width * 0.039,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.04,
                            bottom: height * 0.04,
                            left: width * 0.05,
                            right: width * 0.05),
                        child: TextFormField(
                          decoration: InputDecoration(
                              constraints: BoxConstraints(
                                maxHeight: height * 0.06,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFormFieldColor),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.08))),
                              filled: true,
                              fillColor: AppColors.textFormFieldColor,
                              labelText: 'Search food',
                              labelStyle: TextStyle(
                                  color: AppColors.placeHolderColor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w500),
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: AppColors.secondaryColor),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: CustomCategoryItem(categoryList: categoryList),
                      ),
                      const CustomHeading(
                          text1: 'Popular Restaurants', text2: 'View all'),
                      //! I need to repair
                      // CustomRestaurantItem(mealList: mealList,controller:,),
                      const CustomHeading(
                          text1: 'Most Popular', text2: 'View all'),
                      SizedBox(
                        height: height * 0.2,
                        child: CustomPopularItem(categoryList: categoryList),
                      ),
                      const CustomHeading(
                          text1: 'Recent Items', text2: 'View all'),
                      CustomRecentItem(mealList: mealList),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
