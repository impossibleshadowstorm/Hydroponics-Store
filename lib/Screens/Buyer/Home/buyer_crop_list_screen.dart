import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Buyer/Home/buyer_crop_description.dart';
import 'package:hydroponics_store/Screens/Buyer/Orders/buyer_cart_screen.dart';
import 'package:hydroponics_store/Screens/Buyer/buyer_landing.dart';

import '../../../Constants/colors.dart';

class BuyerCropListScreen extends StatefulWidget {
  final cropCategory;
  final cropType;

  const BuyerCropListScreen({
    Key? key,
    required this.cropCategory,
    required this.cropType,
  }) : super(key: key);

  @override
  State<BuyerCropListScreen> createState() => _BuyerCropListScreenState();
}

class _BuyerCropListScreenState extends State<BuyerCropListScreen> {
  BuyerMainController buyerMainController = Get.find();
  UserModeController userModeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.newGreyBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              customAppBar(widget.cropType.toString().capitalizeFirst),
              SizedBox(
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
    });
  }

  Widget addedCropsList() {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection("products").get(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var cropTypeData = [];
          var farmerList = [];
          snapshot.data?.docs.toList().forEach((element) {
            if (element.data()["cropType"] == widget.cropType &&
                element.data()["cropCategory"] == widget.cropCategory) {
              cropTypeData.add(element);
              // farmerList.add(buyerMainController
              //     .getAllProducts(element.data()["farmerId"]));
            }
          });

          if (cropTypeData.isNotEmpty) {
            return ListView.builder(
              itemCount: cropTypeData.length,
              itemBuilder: (context, index) {
                return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc("farmer")
                      .collection(cropTypeData[index]["farmerId"])
                      .doc("details")
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.only(right: 10),
                        height: 120,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => BuyerCropDescription(
                                productId: cropTypeData[index].id));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                padding: const EdgeInsets.all(10),
                                child: Image(
                                  image: NetworkImage(
                                      snapshot.data?.data()!["profileImage"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15),
                                          Text(
                                            snapshot.data?.data()!["fullName"],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            snapshot.data?.data()!["address"],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "1 Km away",
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
                    } else {
                      return Container();
                    }
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text("No Any Seller."),
            );
          }
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
                    buyerMainController.bottomNavIndex.value = 1;
                    Get.offAll(()=> const BuyerLanding());
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: 50,
                        height: 40,
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: ColorConstants.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              buyerMainController.cartProduct.length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
