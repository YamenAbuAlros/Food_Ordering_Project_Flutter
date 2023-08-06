import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodordering/core/enums/bottom_navigation.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
    required this.bottomNavigationEnum,
    required this.onTap,
  });

  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter: _ClipShadowShadowPainter(
            clipper: BottomNavigationClipper(),
            shadow: Shadow(
              blurRadius: 15,
              color: AppColors.placeHolderColor,
            ),
          ),
          child: ClipPath(
            clipper: BottomNavigationClipper(),
            child: Container(
              width: width,
              height: height * 0.11,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 0.025,
              horizontal: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                navItem(
                  imageName: 'ic_menu',
                  text: tr("Menu"),
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.MENU,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MENU, 0);
                  },
                ),
                navItem(
                  imageName: 'ic_shopping',
                  text: tr("Offers"),
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.OFFERS,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.OFFERS, 1);
                  },
                ),
                (width * 0.25).sbw,
                navItem(
                  imageName: 'ic_user',
                  text: tr("Profile"),
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.PROFILE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 3);
                  },
                ),
                navItem(
                  imageName: 'ic_more',
                  text: tr("More"),
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.MORE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MORE, 4);
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.05),
          child: InkWell(
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              backgroundColor:
                  widget.bottomNavigationEnum == BottomNavigationEnum.HOME
                      ? AppColors.mainOrangeColor
                      : AppColors.placeHolderColor,
              radius: width * 0.1,
              child: SvgPicture.asset(
                'assets/images/ic_home.svg',
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imageName.svg',
            color: isSelected
                ? AppColors.mainOrangeColor
                : AppColors.placeHolderColor,
            width: width * 0.05,
          ),
          SizedBox(
            height: width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainOrangeColor
                  : AppColors.placeHolderColor,
              fontSize: width * 0.045,
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3, 0);
    path0.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path0.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path0.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
