import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Transporter/transporterMainController.dart';
import 'package:hydroponics_store/Screens/Transporter/Delivery/transporter_delivery_screen.dart';

import '../../Constants/colors.dart';

class TransporterLanding extends StatefulWidget {
  const TransporterLanding({Key? key}) : super(key: key);

  @override
  State<TransporterLanding> createState() => _TransporterLandingState();
}

class _TransporterLandingState extends State<TransporterLanding> {
  TransporterMainController transporterMainController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return Scaffold(
          body: IndexedStack(
            index: transporterMainController.bottomNavIndex.value,
            children: transporterMainController.bottomNavigationPages,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const TransporterDeliveryScreen(), transition: Transition.downToUp);
            },
            backgroundColor: ColorConstants.primaryColor,
            child: const Icon(Icons.shopping_cart),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: AnimatedBottomNavigationBar(
              splashColor: ColorConstants.primaryColor,
              activeColor: ColorConstants.primaryColor,
              inactiveColor: Colors.black.withOpacity(.5),
              icons: const [Icons.home_filled, Icons.person],
              activeIndex: transporterMainController.bottomNavIndex.value,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              onTap: (index) {
                transporterMainController.bottomNavIndex.value = index;
              },
            ),
          ),
        );
      },
    );
  }
}
