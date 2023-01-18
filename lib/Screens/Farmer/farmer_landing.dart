import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerMainController.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Screens/Farmer/Orders/order_screen.dart';

class FarmerLanding extends StatefulWidget {
  const FarmerLanding({Key? key}) : super(key: key);

  @override
  State<FarmerLanding> createState() => _FarmerLandingState();
}

class _FarmerLandingState extends State<FarmerLanding> {
  FarmerMainController farmerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: ColorConstants.fadedWhiteColor,
          body: IndexedStack(
            index: farmerMainController.bottomNavIndex.value,
            children: farmerMainController.bottomNavigationPages,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: ColorConstants.fadedWhiteColor,
            onTap: (index){
              farmerMainController.changeIndex(index);
            },
            index: farmerMainController.bottomNavIndex.value,
            items: const [
              Icon(Icons.home_filled),
              Icon(Icons.shopping_cart),
              Icon(Icons.person)
            ],
          ),
        );
      },
    );
  }
}