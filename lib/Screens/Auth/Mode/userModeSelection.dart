import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';

class UserModeSelection extends StatefulWidget {
  const UserModeSelection({Key? key}) : super(key: key);

  @override
  State<UserModeSelection> createState() => _UserModeSelectionState();
}

class _UserModeSelectionState extends State<UserModeSelection> {
  UserModeController userModeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => IndexedStack(
          index: userModeController.bottomNavIndex.value,
          children: userModeController.bottomNavigationPages,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            tabs: userModeController.iconsList,
            padding: const EdgeInsets.all(12.0),
            gap: 10.0,
            onTabChange: (index) {
              userModeController.changePage(index);
            },
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: ColorConstants.primaryColor,
          ),
        ),
      ),
    );
  }
}
