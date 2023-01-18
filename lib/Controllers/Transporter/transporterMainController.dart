import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Screens/Transporter/Home/transporter_home_screen.dart';
import 'package:hydroponics_store/Screens/Transporter/Profile/transporter_profile_screen.dart';

class TransporterMainController extends GetxController{
  var bottomNavIndex = 0.obs;
  var cropType = 0.obs;

  List<Widget> bottomNavigationPages = [
    const TransporterHomeScreen(),
    const TransporterProfileScreen(),
  ];

  changeIndex(index) {
    bottomNavIndex.value = index;
  }
}