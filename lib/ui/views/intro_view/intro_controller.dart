import 'package:foodordering/core/translation/app_translation.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  RxInt currentindex = 0.obs;
  List image = [
    'assets/images/intro0.svg',
    'assets/images/intro1.svg',
    'assets/images/intro2.svg'
  ];
  List<String> titleList = [
    tr("title_Intro1"),
    tr("title_Intro2"),
    tr("title_Intro3"),
  ];
  List<String> descriptionList = [
    tr("desc_Intro1"),
    tr("desc_Intro2"),
    tr("desc_Intro3"),
  ];
  incrementIndex() {
  
    currentindex.value += 1;
  }
}
