import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsController extends GetxController {
  Completer<GoogleMapController> controller = Completer();

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(28.2378241, 83.9820218),
    zoom: 16.5,
  );

  final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
//to move the camera to given position
  Future<void> goToTheLake() async {
    final GoogleMapController maincontroller = await controller.future;
    maincontroller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
