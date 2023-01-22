import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Farmer/Home/farmer_home_screen.dart';
import 'package:hydroponics_store/Screens/Farmer/Orders/order_screen.dart';
import 'package:hydroponics_store/Screens/Farmer/Profile/farmer_profile_screen.dart';

class FarmerMainController extends GetxController {
  UserModeController userModeController = Get.find();

  var bottomNavIndex = 0.obs;

  var editCropsActivated = false.obs;

  TextEditingController updateCropName = TextEditingController();
  TextEditingController updateCropCategory = TextEditingController();
  TextEditingController updateCropPrice = TextEditingController();
  TextEditingController updateCropExpiryDate = TextEditingController();

  List<Widget> bottomNavigationPages = [
    const FarmerHomeScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  changeIndex(index) {
    bottomNavIndex.value = index;
  }

  collectionQuerySnapshot(collectionName) {
    var products = FirebaseFirestore.instance.collection(collectionName).get();

    return products;
  }


}
