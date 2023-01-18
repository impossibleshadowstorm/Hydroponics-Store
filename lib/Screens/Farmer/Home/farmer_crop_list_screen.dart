import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerMainController.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Farmer/Home/farmer_crop_description.dart';

import '../../../Constants/colors.dart';
import 'addNewCrop.dart';

class FarmerCropListScreen extends StatefulWidget {
  final cropType;

  const FarmerCropListScreen({Key? key, required this.cropType})
      : super(key: key);

  @override
  State<FarmerCropListScreen> createState() => _FarmerCropListScreenState();
}

class _FarmerCropListScreenState extends State<FarmerCropListScreen> {
  FarmerMainController farmerMainController = Get.find();
  UserModeController userModeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            customAppBar(widget.cropType),
            Container(
              height: (MediaQuery.of(context).size.height * 0.96) -
                  MediaQuery.of(context).padding.top -
                  AppBar().preferredSize.height,
              width: MediaQuery.of(context).size.width,
              child: addedCropsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget addedCropsList() {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: farmerMainController.collectionQuerySnapshot("products"),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var cropTypeData = [];
          snapshot.data?.docs.toList().forEach((element) {
            if (element.data()["cropType"] ==
                    widget.cropType.toString().toLowerCase() &&
                element.data()["farmerId"] ==
                    userModeController.getRightData()["phone"].text) {
              cropTypeData.add(element);
            }
          });
          return ListView.builder(
            itemCount: cropTypeData.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 10),
                height: 120,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: (){
                    Get.to(() => CropDescription(productId: cropTypeData[index].id));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: NetworkImage(cropTypeData[index]["cropImage"]),
                          fit: BoxFit.cover,
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
                                children: [
                                  const SizedBox(height: 15),
                                  Text(
                                    cropTypeData[index]["cropName"],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${cropTypeData[index]["cropPrice"]} /- Kg.",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
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
                                children: [
                                  Text(
                                    "Expiry Date: ${cropTypeData[index]["cropExpiryDate"]}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
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
        return Center(
          child: CircularProgressIndicator(
            color: ColorConstants.primaryColor,
          ),
        );
      },
    );
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 40,
              child: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                InkWell(
                  onTap: () {
                    Get.to(() => const AddNewCrop());
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    width: 50,
                    height: 40,
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
