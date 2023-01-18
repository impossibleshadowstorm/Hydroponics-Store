import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';
import '../../../Controllers/userModeController.dart';
import '../../Auth/Mode/userModeSelection.dart';

class TransporterHomeScreen extends StatefulWidget {
  const TransporterHomeScreen({Key? key}) : super(key: key);

  @override
  State<TransporterHomeScreen> createState() => _TransporterHomeScreenState();
}

class _TransporterHomeScreenState extends State<TransporterHomeScreen> {
  UserModeController userModeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar('Home'),
              Container(
                height: (MediaQuery.of(context).size.height * 0.899) -
                    MediaQuery.of(context).padding.top -
                    AppBar().preferredSize.height,
                child: addedCropsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addedCropsList() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("assets/images/family.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 15),
                            Text(
                              "Tushar Anthwal and distributors",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "NH 250, Shop No. 25",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Dehradun, UK",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Transport Quantity: 250 Kg",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
                const SizedBox(
                  width: 50,
                  height: 40,
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    userModeController.signOut();
                    Get.offAll(() => const UserModeSelection());
                  },
                  child: Container (
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    width: 50,
                    height: 40,
                    child: const Icon(
                      Icons.logout_sharp,
                      size: 30,
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
