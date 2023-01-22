import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
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
  BuyerMainController buyerMainController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    buyerMainController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFE1E6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar('Home'),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.899) -
                    MediaQuery.of(context).padding.top -
                    AppBar().preferredSize.height,
                child: cropCategory(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cropCategory(){
    return Obx(() {
      if(buyerMainController.dataL.value == 0){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }else {
        return ListView.builder(
          itemCount: buyerMainController.foundCropData.value.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(right: 10),
              height: 150,
              margin:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(buyerMainController
                          .foundCropData.value[index]["cropImage"]),
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
                          margin:
                          const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            buyerMainController.foundCropData.value[index]
                            ["cropCategory"],
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
                            Get.to(() =>
                                BuyerCropListScreen(
                                  cropType: "hydroponic",
                                  cropCategory: buyerMainController
                                      .foundCropData.value[index]
                                  ["cropCategory"],
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Hydroponics",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            Get.to(() =>
                                BuyerCropListScreen(
                                  cropType: "organic",
                                  cropCategory: buyerMainController
                                      .foundCropData.value[index]
                                  ["cropCategory"],
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              // color: ColorConstants.primaryColor,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Organic",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            Get.to(() =>
                                BuyerCropListScreen(
                                  cropType: "inorganic",
                                  cropCategory: buyerMainController
                                      .foundCropData.value[index]
                                  ["cropCategory"],
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              // color: ColorConstants.primaryColor,
                            ),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Inorganic",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
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
    });
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
            for (int i = 0;
                i < snapshot.data!.docs.toList().length.toInt();
                i++) {
              if (snapshot.data?.docs.toList()[i]["cropCategory"] ==
                  cropCategoryList[j]) {
                cropTypeData.add(snapshot.data?.docs.toList()[i]);
              }
              if (cropTypeData.length - 1 == j) {
                break;
              }
            }
          }

          // var filterCropData = [].obs;
          // buyerMainController.setData(cropTypeData);

          return Obx(() {
            buyerMainController.a.value = 2;
            print(buyerMainController.a.value == 2);
            return ListView.builder(
              itemCount: buyerMainController.foundCropData.value.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: NetworkImage(buyerMainController
                              .foundCropData.value[index]["cropImage"]),
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: Text(
                                buyerMainController.foundCropData.value[index]
                                    ["cropCategory"],
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
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Hydroponics",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      height: 25,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
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
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  // color: ColorConstants.primaryColor,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Organic",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      height: 25,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
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
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  // color: ColorConstants.primaryColor,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Inorganic",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      height: 25,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
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
          });
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: TextField(
                strutStyle: StrutStyle.disabled,
                onChanged: (value) {
                  buyerMainController.getFilteredCropData(value);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type to Search",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  // labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  userModeController.signOut();
                  Get.offAll(() => const UserModeSelection());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  // width: 50,
                  height: 30,
                  child: Row(
                    children: const [
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.logout_sharp,
                        size: 17,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
