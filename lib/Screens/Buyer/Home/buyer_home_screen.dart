import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Screens/Buyer/Home/buyer_crop_list_screen.dart';
import '../../../Controllers/userModeController.dart';
import '../../Auth/Mode/userModeSelection.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
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
              SizedBox(
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
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection("products").get(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var cropTypeData = [];
          var cropCategoryList = [];

          snapshot.data?.docs.toList().forEach((element) {
            cropCategoryList.add(element.data()["cropCategory"]);
          });
          cropCategoryList = cropCategoryList.toSet().toList();

          for (var j = 0; j < cropCategoryList.length; j++) {
            for (int i = 0; i < snapshot.data!.docs.toList().length.toInt(); i++) {
              if (snapshot.data?.docs.toList()[i]["cropCategory"] ==
                  cropCategoryList[j]) {
                cropTypeData.add(snapshot.data?.docs.toList()[i]);
              }
              if (cropTypeData.length - 1 == j) {
                break;
              }
            }
          }
          return ListView.builder(
            itemCount: cropTypeData.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 10),
                height: 150,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: Text(
                              cropTypeData[index]["cropName"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              Get.to(() => BuyerCropListScreen(
                                    cropType: "hydroponic",
                                    cropCategory: cropTypeData[index]
                                        ["cropCategory"],
                                  ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: ColorConstants.primaryColor,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: const Text(
                                "Hydroponics",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              Get.to(() => BuyerCropListScreen(
                                    cropType: "organic",
                                    cropCategory: cropTypeData[index]
                                        ["cropCategory"],
                                  ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: ColorConstants.primaryColor,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: const Text(
                                "Organic",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              Get.to(() => BuyerCropListScreen(
                                    cropType: "inorganic",
                                    cropCategory: cropTypeData[index]
                                        ["cropCategory"],
                                  ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: ColorConstants.primaryColor,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: const Text(
                                "Inorganic",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
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
    //   ListView.builder(
    //   itemCount: 50,
    //   itemBuilder: (context, index) {
    //     return InkWell(
    //       onTap: () {
    //         Get.to(()=>const FarmerDetailScreen());
    //       },
    //       child: Container(
    //         padding: const EdgeInsets.only(right: 10),
    //         height: 120,
    //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //         color: Colors.white,
    //         width: MediaQuery.of(context).size.width,
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 120,
    //               width: 120,
    //               padding: const EdgeInsets.all(10),
    //               child: const Image(
    //                 image: AssetImage("assets/images/family.png"),
    //               ),
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: const [
    //                         SizedBox(height: 15),
    //                         Text(
    //                           "Tushar Anthwal and distributors",
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 14,
    //                           ),
    //                         ),
    //                         Text(
    //                           "NH 250, Shop No. 25",
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                         Text(
    //                           "Dehradun, UK",
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: const [
    //                         Text(
    //                           "Updated On: 25-12-2023",
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                         Text(
    //                           "Hydroponic plant",
    //                           overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                         SizedBox(height: 15),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
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
                  child: Container(
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
