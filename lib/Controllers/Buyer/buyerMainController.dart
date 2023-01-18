import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Model/FarmerModel.dart';
import 'package:hydroponics_store/Model/plantsModel.dart';

import '../../Model/CartProductListModel.dart';
import '../../Screens/Buyer/Home/buyer_home_screen.dart';
import '../../Screens/Buyer/Orders/buyer_cart_screen.dart';
import '../../Screens/Buyer/Profile/buyer_profile_screen.dart';

class BuyerMainController extends GetxController {
  var bottomNavIndex = 0.obs;
  var cropType = 0.obs;

  TextEditingController quantityController = TextEditingController();

  List<Widget> bottomNavigationPages = [
    const BuyerHomeScreen(),
    const BuyerCartScreen(),
    const BuyerProfileScreen(),
  ];

  changeIndex(index) {
    bottomNavIndex.value = index;
  }

  getAllProducts(farmerId) async {
    var farmerDetails = {};

    var products = await FirebaseFirestore.instance
        .collection("users")
        .doc("farmer")
        .collection(farmerId)
        .get();

    for (int i = 0; i < products.docs.length; i++) {
      var item = products.docs[i];
      if (item.id == "details") {
        farmerDetails.addAll({
          "aadhaarNumber": item.data()["aadhaarNumber"],
          "address": item.data()["address"],
          "alternateMobileNumber": item.data()["alternateMobileNumber"],
          "city": item.data()["city"],
          "fullName": item.data()["fullName"],
          "gstNumber": item.data()["gstNumber"],
          "mobileNumber": item.data()["mobileNumber"],
          "profileImage": item.data()["profileImage"],
          "state": item.data()["state"],
          "tanNumber": item.data()["tanNumber"],
        });
      }
    }
    return farmerDetails;
  }

  // Cart Controller
  List<CartProductListModel> cartProduct =
      List<CartProductListModel>.empty().obs;

  double get totalQuantity =>
      cartProduct.fold(0, (totalQty, element) => totalQty + element.qty);

  double get totalPrice => cartProduct.fold(
      0,
      (totalCost, element) =>
          totalCost + (element.qty * double.parse(element.plant.cropPrice)));

  changeQuantityInCart(PlantsModel plant) {
    final index = cartProduct
        .indexWhere((element) => element.plant.cropId == plant.cropId);

    if (cartProduct[index].qty > 1) {
      cartProduct[index] = CartProductListModel(
        plant: plant,
        qty: double.parse(quantityController.text),
      );
    } else {
      cartProduct.removeAt(index);
    }
  }

  deleteFromCart(int index) {
    cartProduct.removeAt(index);
  }

  addToCart(PlantsModel plant) {
    final index = cartProduct.indexWhere((element) {
      return element.plant.cropId == plant.cropId;
    });

    if (index > -1) {
      cartProduct[index] = CartProductListModel(
        plant: plant,
        qty: double.parse(quantityController.text),
      );
    } else {
      cartProduct.add(
        CartProductListModel(
            plant: plant, qty: double.parse(quantityController.text)),
      );
    }

    // Initializes again the Number of items in product description screen to 1
    quantityController.text = "";
  }

  get products => cartProduct;
}
