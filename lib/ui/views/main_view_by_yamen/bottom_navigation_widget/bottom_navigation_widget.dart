import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodordering/core/enums/bottom_app_bar_items.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/menu_view/desserts_view/desserts_view.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/more_view/more_view.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/offers_view/offers_view.dart';
import 'package:foodordering/ui/views/main_view_by_yamen/profile_view/profile_view.dart';

class CustomBottomAppBar {
  static showCustomBottomAppBar(BuildContext ctx,
      {required BottomAppBarItems bottomAppBarItems}) {
    final size = MediaQuery.of(ctx).size;

    Color menu = AppColors.placeHolderColor;
    Color offers = AppColors.placeHolderColor;
    Color profile = AppColors.placeHolderColor;
    Color more = AppColors.placeHolderColor;

    switch (bottomAppBarItems) {
      case BottomAppBarItems.MENU:
        menu = AppColors.mainOrangeColor;
        break;
      case BottomAppBarItems.OFFERS:
        offers = AppColors.mainOrangeColor;
        break;
      case BottomAppBarItems.PROFILE:
        profile = AppColors.mainOrangeColor;
        break;
      case BottomAppBarItems.MORE:
        more = AppColors.mainOrangeColor;
        break;
      case BottomAppBarItems.HOME:
        break;
    }
    return BottomAppBar(
      color: AppColors.mainWhiteColor,
      shape: const CircularNotchedRectangle(), 
      height: size.height * 0.11,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      notchMargin: 10, //notche margin between floating button and bottom appbar
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                return const DessertsView();
              }));
            },
            child: Column(
              children: [
                SvgPicture.asset('assets/images/menu.svg',
                    color: menu, width: size.width * 0.07),
                CustomText(text: 'Menu', textcolor: menu)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                return const OffersView();
              }));
            },
            child: Column(
              children: [
                SvgPicture.asset('assets/images/offers.svg',
                    color: offers, width: size.width * 0.07),
                CustomText(text: 'Offers', textcolor: offers),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                return const ProfileView();
              }));
            },
            child: Column(
              children: [
                SvgPicture.asset('assets/images/profile.svg',
                    color: profile, width: size.width * 0.07),
                CustomText(text: 'Profile', textcolor: profile),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                return const MoreView();
              }));
            },
            child: Column(
              children: [
                SvgPicture.asset('assets/images/more.svg',
                    color: more, width: size.width * 0.07),
                CustomText(text: 'More', textcolor: more),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
