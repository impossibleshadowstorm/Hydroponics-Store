import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Screens/Auth/Mode/userModeSelection.dart';
import 'package:hydroponics_store/Screens/Farmer/Home/addNewCrop.dart';
import 'package:hydroponics_store/Screens/Farmer/Home/farmer_crop_list_screen.dart';
import '../../../Controllers/userModeController.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({Key? key}) : super(key: key);

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  UserModeController userModeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.newGreyBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            customAppBar('Home'),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.89) -
                  MediaQuery.of(context).padding.top -
                  AppBar().preferredSize.height,
              child: addedCropsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget addedCropsList() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              Get.to(() => const FarmerCropListScreen(cropType: "Hydroponic"));
            },
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("assets/images/plant-three.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Hydroponic Crops",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              Get.to(() => const FarmerCropListScreen(cropType: "Organic"));
            },
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("assets/images/plant-three.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Organic Crops",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              Get.to(() => const FarmerCropListScreen(cropType: "Inorganic"));
            },
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("assets/images/plant-three.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Inorganic Crops",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          Text(
            appBarTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const AddNewCrop());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        height: 35,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 17,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Add New Crops",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    userModeController.signOut();
                    Get.offAll(() => const UserModeSelection());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: const BorderRadius.all(Radius.circular(7))),
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.power_settings_new_sharp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
