import 'dart:async';

import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/map_view/map_utili.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../core/data/repositories/country_repositories.dart';

class MapController extends BaseController {
  MapController(this.currentLocation);
   List arabCountries = [
    'Algeria',
    'Bahrain',
    'Comoros',
    'Djibouti',
    'Egypt',
    'Iraq',
    'Jordan',
    'Kuwait',
    'Lebanon',
    'Libyan Arab Jamahiriya',
    'Mauritania',
    'Morocco',
    'Oman',
    'Palestinian Territory, Occupied',
    'Qatar',
    'Saudi Arabia',
    'Somalia',
    'Sudan',
    'Syrian Arab Republic',
    'Tunisia',
    'United Arab Emirates',
    'Western Sahara',
    'Yemen'
  ];

  late LocationData currentLocation;
  late CameraPosition initalCameraPosition;

  RxSet<Marker> markers = <Marker>{}.obs;

  RxString streetName = ''.obs;
  

  late LatLng selectedLocation;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  @override
  void onInit() {
    initalCameraPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.43296265331129,
          currentLocation.longitude ?? -122.08832357078792),
      zoom: 14.4746,
    );

    selectedLocation = LatLng(currentLocation.latitude ?? 37.43296265331129,
        currentLocation.longitude ?? -122.08832357078792);
    super.onInit();
  }

  void addMarker(
      {required String markerId,
      required LatLng position,
      String? imageUrl,
      String? imageName}) async {
    BitmapDescriptor markerImage = imageName != null
        ? await MapUtil.imageFromAsset(imageName: imageName)
        : await MapUtil.imageFromUrl(imageUrl: imageUrl ?? '');

    markers.add(Marker(
        markerId: MarkerId(markerId), position: position, icon: markerImage));
    update();
  }

  void getStreetName() async {
    await locationService
        .getAddressInfo(LocationData.fromMap({
      'latitude': selectedLocation.latitude,
      'longitude': selectedLocation.longitude
    }))
        .then((value) {
      streetName.value = value?.street ?? 'No Street name';
    });

    update();
  }

  Future<void> markerAllCountry() async {
    var list = CountryRepositories().getAll();
    for (var element in list) {
      addMarker(
          imageName:arabCountries.contains(element.country)?'markerblue.png':'markerred.png',
          markerId: '${element.country}',
          position: LatLng(element.latitude, element.longitude));
    }
  }
}

//! THIS MADE BY ME --
// class MapController extends GetxController {
//   LocationData currentLocation = LocationData.fromMap({});
//   // MapController(LocationData currentLocation1) {
//   //   currentLocation = currentLocation1;
//   // }
//   MapController(this.currentLocation);

//   late CameraPosition initalCameraPosition;
//   RxString selectedLocationStreet = ''.obs;

//   var selectedLocation = const LatLng(0, 0).obs;

//   RxList<Marker> markers = <Marker>[].obs;

//   CameraPosition kLake = const CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   final Completer<GoogleMapController> controllerCompleter =
//       Completer<GoogleMapController>();

//   @override
//   void onInit() {
//     initalCameraPosition = CameraPosition(
//       target: LatLng(currentLocation.latitude ?? 37.43296265331129,
//           currentLocation.longitude ?? -122.08832357078792),
//       zoom: 14.4746,
//     );

//     selectedLocation.value = LatLng(
//         currentLocation.latitude ?? 37.43296265331129,
//         currentLocation.longitude ?? -122.08832357078792);

//     super.onInit();
//   }

//   void addToMarker() {
//     markers.add(Marker(
//         markerId: const MarkerId('Current'), position: selectedLocation.value));
//     getAddressInfo();
//   }

//   void getAddressInfo() async {
//     await locationService
//         .getAddressInfo(LocationData.fromMap({
//       'latitude': selectedLocation.value.latitude,
//       'longitude': selectedLocation.value.longitude
//     }))
//         .then((value) {
//       if (value != null) {
//         selectedLocationStreet.value = value.street!;
//       }
//     });
//   }

//   Future<void> goToTheLake() async {
//     final GoogleMapController controller = await controllerCompleter.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
//   }
// }

