import 'package:foodordering/core/data/repositories/shared_preference_repositories.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/intro_view/intro_view.dart';
import 'package:foodordering/ui/views/landing_view/landing_view.dart';
import 'package:foodordering/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(() => const IntroView());
      } else {
        Get.off(() => storage.isLoggedIn
            ? const MainView()
            :  LandingView());
      }
      storage.setFirstLunch(false);
    });
    super.onInit();
  }

}
