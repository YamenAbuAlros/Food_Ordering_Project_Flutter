import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/core/enums/connectivity_status.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/landing_view/landing_view.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.ONLINE,
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            defaultTransition: Transition.circularReveal,
            transitionDuration: const Duration(milliseconds: 12),
            title: 'Flutter Demo',
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            locale: getLocale(),
            fallbackLocale: getLocale(),
            translations: AppTranslation(), //1. call BotToastInit
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:  LandingView()));
  }
}

Locale getLocale() {
  if (storage.getAppLanguage() == 'ar') {
    return const Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'en') {
    return const Locale('en', 'US');
  } else {
    return const Locale('tr', 'TR');
  }
}
