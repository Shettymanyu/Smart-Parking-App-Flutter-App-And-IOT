import 'dart:async';

import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Controller/IotController.dart';
import 'package:car_parking_system/Pages/AboutUs/AboutUs..dart';
import 'package:car_parking_system/Pages/Home/HomePage.dart';
import 'package:car_parking_system/Pages/PakingSlotPage/ParkingSlotPage.dart';
import 'package:car_parking_system/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/ParkingController.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();
    const LatLng center = LatLng(18.990249501657, 73.12765727367228);
    ParkingController parkingController = Get.put(ParkingController());
    AuthController authController = Get.put(AuthController());
    ParkingController1 parkingController1 = Get.put(ParkingController1());
    Set<Marker> markers = {
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_1'),
        position: const LatLng(18.98992201471378, 73.12701027659394),
      ),
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_2'),
        position: const LatLng(18.989272738055547, 73.12658648756371),
      ),
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_3'),
        position: const LatLng(18.989417346877385, 73.12774191244466),
      ),
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_4'),
        position: const LatLng(18.99066291001757, 73.12605839690882),
      ),
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_5'),
        position: const LatLng(18.98877937189476, 73.12820455792917),
      ),
      Marker(
        onTap: () {
          Get.to(const HomePage());
        },
        visible: true,
        markerId: const MarkerId('parking_5'),
        position: const LatLng(18.990741896646345, 73.12885354673529),
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Stations'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const ProfilePage());
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              parkingController1.initSlot();
              // Get.to(const AboutUs());
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: GoogleMap(
        buildingsEnabled: true,
        compassEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: center,
          zoom: 18.0,
        ),
        markers: markers,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
