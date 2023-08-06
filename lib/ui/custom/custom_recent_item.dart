import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

import '../shared/colors.dart';

class CustomRecentItem extends StatelessWidget {
  const CustomRecentItem({super.key, required this.mealList});
  final List mealList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mealList.length,
      addAutomaticKeepAlives: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
              top: height * 0.03, bottom: height * 0.025, start: width * 0.05),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.05),
                child: CachedNetworkImage(
                  height: height * 0.1,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: width,
                  // fit: BoxFit.cover,
                  // height: size.height * 0.12,
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.mainOrangeColor,
                    strokeWidth: 2,
                  ),
                  imageUrl: getFullImageUrl(mealList[index].images![0]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: mealList[index].name!,
                        fontsize: width * 0.04,
                        textcolor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                    CustomText(
                        text: 'Café Coffee',
                        textcolor: AppColors.placeHolderColor),
                    Row(
                      children: [
                        const CustomSvgPicture(imagename: 'star'),
                        CustomText(
                            text: ' 4.9',
                            textcolor: AppColors.mainOrangeColor,
                            fontsize: width * 0.03),
                        CustomText(
                            text: '  (124 ratings)',
                            textcolor: AppColors.placeHolderColor),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return (width * 0.01).sbh;
      },
    );
  }
}
