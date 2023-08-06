import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_button.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_text.dart';
import 'package:foodordering/ui/shared/extenssions/extenssions.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/landing_view/landing_controller.dart';
import 'package:foodordering/ui/views/login_view/login_view.dart';
import 'package:foodordering/ui/views/sign_up_view/sign_up_view.dart';
import 'package:foodordering/ui/views/map_view/map_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LandingView extends StatelessWidget {
  LandingView({super.key});

  LandingController controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            (height * 0.25).pdt,
            SvgPicture.asset('assets/images/Logo.svg'),
            (height * 0.04).pdt,
            CustomText(
              text: tr("desc_Landing"),
            ),
            (height * 0.04).pdt,
            CustomButton(
              backgroundColor: controller.buttonColor.value,
              text: tr("key_login"),
              textColor: AppColors.mainWhiteColor,
              borderColor: AppColors.mainOrangeColor,
              onPressed: () async {
                // LocationData? currentLocation =
                //     await locationService.getUserCurrentLocation();
                // if (currentLocation != null) {
                //   Get.to(MapView(currentLocation: currentLocation));
                // }
                Get.off(() => const LoginView());
              },
              paddingLR: width * 0.1,
            ),
            (height * 0.04).pdt,
            CustomButton(
              text: tr("create_Account"),
              backgroundColor: AppColors.mainWhiteColor,
              textColor: AppColors.mainOrangeColor,
              borderColor: AppColors.mainOrangeColor,
              onPressed: () {
                Get.off(() => const SignUpView());
              },
              paddingLR: width * 0.1,
            ),
          ]),
          CustomPaint(
            painter: _ClipShadowShadowPainter(
                clipper: MyClipper(), shadow: Shadow(blurRadius: width * 0.04)),
            child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainOrangeColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width * 0.09),
                            bottomRight: Radius.circular(width * 0.09))),
                    width: width,
                    height: height * 0.45,
                    child: SvgPicture.asset(
                        'assets/images/Background_objects.svg',
                        fit: BoxFit.fill))),
          ),
        ]),
      ),
    );
  }
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      throw UnimplementedError();
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0012500, size.height * 0.0020000);
    path0.quadraticBezierTo(size.width * 0.0012500, size.height * 0.0020000,
        size.width * 0.0012500, size.height * 0.0020000);
    path0.quadraticBezierTo(size.width * 0.1256250, size.height * 0.0020000,
        size.width * 0.4987500, size.height * 0.0020000);
    path0.lineTo(size.width * 0.4987500, size.height * 0.0020000);
    path0.lineTo(size.width * 0.9950000, size.height * 0.0020000);
    path0.lineTo(size.width * 0.9950000, size.height * 0.0020000);
    path0.lineTo(size.width * 0.9950000, size.height * 0.9920000);
    path0.lineTo(size.width * 0.9950000, size.height * 0.9920000);
    path0.lineTo(size.width * 0.6862500, size.height * 0.9920000);
    path0.lineTo(size.width * 0.6862500, size.height * 0.9920000);
    path0.quadraticBezierTo(size.width * 0.6469875, size.height * 0.7036800,
        size.width * 0.5047250, size.height * 0.7040000);
    path0.quadraticBezierTo(size.width * 0.3452375, size.height * 0.7020200,
        size.width * 0.3125000, size.height * 0.9960000);
    path0.lineTo(size.width * 0.3125000, size.height * 0.9960000);
    path0.lineTo(0, size.height * 0.9920000);
    path0.lineTo(0, size.height * 0.9920000);
    path0.lineTo(size.width * 0.0012500, size.height * 0.0020000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
