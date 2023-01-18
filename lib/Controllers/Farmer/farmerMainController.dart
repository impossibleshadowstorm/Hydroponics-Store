import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Farmer/Home/farmer_home_screen.dart';
import 'package:hydroponics_store/Screens/Farmer/Orders/order_screen.dart';
import 'package:hydroponics_store/Screens/Farmer/Profile/farmer_profile_screen.dart';

import '../../Model/plantsModel.dart';

class FarmerMainController extends GetxController {
  UserModeController userModeController = Get.find();

  var bottomNavIndex = 0.obs;

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

  // getAllProducts() async {
  //   var products =
  //       await FirebaseFirestore.instance.collection("products").get();
  //
  //   var list = products.docs
  //       .map((item) => PlantsModel(
  //             cropId: item.id,
  //             cropName: item.data()["cropName"],
  //             cropCategory: item.data()["cropCategory"],
  //             cropExpiryDate: item.data()["cropExpiryDate"],
  //             cropImage: item.data()["cropImage"],
  //             cropPrice: item.data()["cropPrice"],
  //             cropType: item.data()["cropType"],
  //             farmerId: item.data()["farmerId"],
  //           ))
  //       .toList();
  //   // print(list[0].cropName);
  //   return list;
  // }
}
