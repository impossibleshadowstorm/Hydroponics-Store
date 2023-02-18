import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Auth/Mode/userModeSelection.dart';
import 'package:hydroponics_store/Screens/Buyer/buyer_landing.dart';
import 'package:hydroponics_store/Screens/Buyer/buyer_registration.dart';
import 'package:hydroponics_store/Screens/Common/location_entry.dart';
import 'package:hydroponics_store/Screens/Common/pinUserLocation.dart';
import 'package:hydroponics_store/Screens/Farmer/farmer_landing.dart';
import 'package:hydroponics_store/Screens/Farmer/farmer_registration.dart';
import 'package:hydroponics_store/Screens/Transporter/transporter_landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserModeController userModeController = Get.find();

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      // Get.offAll(() => const Authentication());
      // Get.offAll(() => const SimpleLogin());
      // Get.offAll(() => const BuyerRegistration());
      // Get.offAll(() => const UserModeSelection());
      // Get.offAll(() => const BuyerLanding());
      // Get.offAll(() => const TransporterLanding());
      // Get.offAll(() => const PinUserLocation());
      // Get.to(() => const LandingScreen());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("userId");
      if (token != null) {
        userModeController.bottomNavIndex.value =
            prefs.getInt("bottomNavIndex")!;
        userModeController.getRightData()["phone"].text =
            prefs.getString("phoneNumber")!;
        Get.offAll(() => userModeController
            .verifiedLandingPages[userModeController.bottomNavIndex.value]);
        ;
      } else {
        Get.offAll(() => const UserModeSelection());
      }
    } else {
      await prefs.setBool('seen', true);
      Get.offAll(() => const OnBoardingScreen());
    }
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        checkFirstSeen();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/images/dosat.png"),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      // width: double.infinity,
                      child: Image.asset("assets/images/ucost.png"),
                    ),
                  ],
                ),
              ),
              const Text(
                "Vegetable & Hydroponic Product with Android Mobile Application of Vegetable Market for Rural Farmers and Urban Users",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/images/dav.jpeg"),
                      ),
                    ),
                    SizedBox(
                      // height: 150,
                      // width: double.infinity,
                      child: Image.asset("assets/images/teri.png"),
                    ),
                    SizedBox(
                      // height: 100,
                      // width: double.infinity,
                      child: Image.asset("assets/images/Pantnagar.jpeg"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
