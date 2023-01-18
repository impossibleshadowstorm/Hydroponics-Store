import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import '../../Controllers/userLocationController.dart';

class PinUserLocation extends StatefulWidget {
  const PinUserLocation({Key? key}) : super(key: key);

  @override
  State<PinUserLocation> createState() => _PinUserLocationState();
}

class _PinUserLocationState extends State<PinUserLocation> {
  UserLocationController userLocationController =
      Get.put(UserLocationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLocationController.getCurrentLocation();
    if (Platform.isIOS) {
      userLocationController.googleApiKey =
          "AIzaSyAOVx4pPWGvKdY67WzJVy6kBX-V8Ti4C6o";
    }
    if (Platform.isAndroid) {
      userLocationController.googleApiKey =
          "AIzaSyCmAUMeVuIkZGtp4ptl3_TIdB6rDUCtows";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: userLocationController.cameraLocation.value,
                  zoom: 16,
                ),
                onCameraMove: (CameraPosition? position) {
                  if (userLocationController.destLocation != position!.target) {
                    userLocationController.changeLatLong(
                        position.target.latitude, position.target.longitude);
                  }
                },
                onCameraIdle: () {
                  print('camera idle');
                  userLocationController.getAddressFromLatLng();
                },
                onTap: (latLng) {
                  print(latLng);
                },
                onMapCreated: (GoogleMapController controller) {
                  userLocationController.mapController.complete(controller);
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: Image.asset(
                    'assets/images/pick_location.png',
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Place pin Carefully on the map.",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 20, top: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: ColorConstants.primaryColor,
                          child: const Center(
                            child: Text(
                              "Confirm Location",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 25,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
