import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodordering/app/my_app_controller.dart';
import 'package:foodordering/core/data/repositories/shared_preference_repositories.dart';
import 'package:foodordering/core/enums/connectivity_status.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/services/cart_servces/cart_service.dart';
import 'package:foodordering/core/services/connectivity_service.dart';
import 'package:foodordering/core/services/location_service.dart';
import 'package:foodordering/core/services/notification_service.dart';
import 'package:foodordering/core/utilis/network_utilis.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//~        Functions To Validation
bool isEmail(String value) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  RegExp passValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{1,}.{8,}$');
  return passValid.hasMatch(value);
}

// bool isName(String value) {
//   RegExp nameValid = RegExp(r"^[A-Z].{1,}[A-Za-z]$");
//   return nameValid.hasMatch(value);
// }

bool isName(String value) {
  RegExp nameValid = RegExp(r"^[A-Za-z]+$");
  return nameValid.hasMatch(value);
}

bool isValidSyriaMobileNumber(String value) {
  RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
  return regex.hasMatch(value);
}

bool isAddress(String value) {
  RegExp regex = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
  return regex.hasMatch(value);
}

bool isAge(String value) {
  RegExp regexp = RegExp(r'^(?:1[01][0-9]|120|1[8-9]|[2-9][0-9])$');
  return regexp.hasMatch(value);
}

String getFullImageUrl(String url) {
  var splitedString = url.split('Images/');
  return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
}

//~  --- Width , Height for Screen-Size  ---

double get width => Get.width;
double get height => Get.height;

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}

SharedPreferenceRepositories get storage =>
    Get.find<SharedPreferenceRepositories>();

CartServices get cartServices => Get.find<CartServices>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

MyAppController get myAppController => Get.find<MyAppController>();

LocationService get locationService => Get.find<LocationService>();
NotificationService get notificationService => Get.find<NotificationService>();

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: width * 0.2,
        height: width * 0.2,
        child: SpinKitCircle(
          color: AppColors.mainOrangeColor,
          size: width * 0.2,
        ),
      );
    });

//! -- For Launcher --

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

sendSms(String path, String body) async {
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: path,
    queryParameters: <String, String>{
      'body': Uri.encodeComponent(body),
    },
  );
  if (await canLaunchUrl(smsLaunchUri)) {
    launchUrl(smsLaunchUri);
  } else {
    CustomShowToast.showMessage(
        message: 'Could not launch $smsLaunchUri',
        messageType: MessageType.REJECTED);
  }
}

sendEmail(String path, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: path,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
    }),
  );
//^ Here you canuse mode with launchUrl for open in our app or in external app

  if (await canLaunchUrl(emailLaunchUri)) {
    launchUrl(emailLaunchUri);
  } else {
    CustomShowToast.showMessage(
        message: 'Could not launch $emailLaunchUri',
        messageType: MessageType.REJECTED);
  }
}

callwith(String path) async {
  final Uri callLaunchUri = Uri(
    scheme: 'tel',
    path: path,
  );
  if (await canLaunchUrl(callLaunchUri)) {
    launchUrl(callLaunchUri);
  } else {
    CustomShowToast.showMessage(
        message: 'Could not launch $callLaunchUri',
        messageType: MessageType.REJECTED);
  }
}

Future<void> openUrl(url) async {
  if (await canLaunchUrl(url)) {
    launchUrl(url);
  } else {
    CustomShowToast.showMessage(
        message: 'Could not launch $url', messageType: MessageType.REJECTED);
  }
}

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;
//!------------------------------------

bool get isOnline =>
    myAppController.connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    myAppController.connectivityStatus == ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline) {
    function();
  } else {
    showNoConnectionMessage();
  }
}

void showNoConnectionMessage() {
  CustomShowToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
