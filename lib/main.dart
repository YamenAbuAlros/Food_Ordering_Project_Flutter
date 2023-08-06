import 'package:flutter/material.dart';
import 'package:foodordering/app/my_app.dart';
import 'package:foodordering/app/my_app_controller.dart';
import 'package:foodordering/core/data/repositories/shared_preference_repositories.dart';
import 'package:foodordering/core/services/cart_servces/cart_service.dart';
import 'package:foodordering/core/services/connectivity_service.dart';
import 'package:foodordering/core/services/location_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'core/services/notification_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  //*  -- Add To Dependency Injection --
  Get.put(SharedPreferenceRepositories());
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(CartServices());
  Get.put(LocationService());

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}
