import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_svgpicture.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

class CustomPopularItem extends StatelessWidget {
  const CustomPopularItem({super.key, required this.categoryList});
  final List categoryList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(start: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: width * 0.25,
                    fit: BoxFit.fill,
                    height: height * 0.12,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: AppColors.mainOrangeColor,
                      strokeWidth: 2,
                    ),
                    imageUrl: getFullImageUrl(categoryList[index].logo!),
                  )),
              SizedBox(
                height: width * 0.02,
              ),
              CustomText(
                  text: categoryList[index].name!,
                  fontsize: width * 0.035,
                  fontWeight: FontWeight.bold,
                  textcolor: AppColors.primaryColor),
              Row(
                children: [
                  CustomText(
                      text: 'Café Western Food',
                      textcolor: AppColors.placeHolderColor),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.07),
                    child: const CustomSvgPicture(imagename: 'star'),
                  ),
                  CustomText(
                    text: ' 4.9',
                    textcolor: AppColors.mainOrangeColor,
                    fontsize: width * 0.03,
                  )
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return (width * 0.01).sbw;
      },
    );
  }
}
