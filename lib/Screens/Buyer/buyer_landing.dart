import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Screens/Buyer/Orders/buyer_cart_screen.dart';
import '../../Constants/colors.dart';

class BuyerLanding extends StatefulWidget {
  const BuyerLanding({Key? key}) : super(key: key);

  @override
  State<BuyerLanding> createState() => _BuyerLandingState();
}

class _BuyerLandingState extends State<BuyerLanding> {
  BuyerMainController buyerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: IndexedStack(
            index: buyerMainController.bottomNavIndex.value,
            children: buyerMainController.bottomNavigationPages,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: ColorConstants.newGreyBackgroundColor,
            onTap: (index) {
              buyerMainController.changeIndex(index);
            },
            buttonBackgroundColor: Colors.black,
            index: buyerMainController.bottomNavIndex.value,
            color: ColorConstants.primaryColor,
            items: const [
              Icon(Icons.home_filled, color: Colors.white,),
              Icon(Icons.shopping_cart, color: Colors.white,),
              Icon(Icons.person, color: Colors.white,)
            ],
          ),
        );
      },
    );
  }
// AnimatedBottomNavigationBar(
// splashColor: ColorConstants.primaryColor,
// activeColor: ColorConstants.primaryColor,
// inactiveColor: Colors.black.withOpacity(.5),
// icons: const [Icons.home_filled, Icons.person],
// activeIndex: buyerMainController.bottomNavIndex.value,
// gapLocation: GapLocation.center,
// notchSmoothness: NotchSmoothness.softEdge,
// onTap: (index) {
// buyerMainController.bottomNavIndex.value = index;
// },
// ),
}
