import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/google%20maps/controller/google_maps_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleScreenMaps extends StatelessWidget {
  GoogleScreenMaps({Key? key}) : super(key: key);
  final GoogleMapsController googleMapsController =
      Get.put(GoogleMapsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps Integration"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            googleMapsController.goToTheLake();
          },
          label: Text("Let'g go")),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        child: GoogleMap(
          compassEnabled: true,
          buildingsEnabled: true,
          indoorViewEnabled: true,
          mapType: MapType.hybrid,
          initialCameraPosition: googleMapsController.kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            googleMapsController.controller.complete(controller);
          },
        ),
      ),
    );
  }
}
