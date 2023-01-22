import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
import 'package:hydroponics_store/Model/plantsModel.dart';
import '../../../Constants/colors.dart';
import '../buyer_landing.dart';

class BuyerCropDescription extends StatefulWidget {
  final productId;

  const BuyerCropDescription({Key? key, required this.productId})
      : super(key: key);

  @override
  State<BuyerCropDescription> createState() => _BuyerCropDescriptionState();
}

class _BuyerCropDescriptionState extends State<BuyerCropDescription> {
  BuyerMainController buyerMainController = Get.put(BuyerMainController());

  final quantityKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection("products")
              .doc(widget.productId)
              .get(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // customAppBar("Crop Details"),
                  Positioned(
                    top: -size.width * 0.5,
                    left: -size.width * 0.25,
                    child: Container(
                      height: size.width * 1.5,
                      width: size.width * 1.5,
                      padding: const EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        color: ColorConstants.newGreyBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 80, left: 20, right: 20),
                        height: size.width,
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image:
                              NetworkImage(snapshot.data?.data()!["cropImage"]),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.width,
                            width: size.width,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 60),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: AppBar().preferredSize.height,
                                  width: size.width,
                                  child: Obx(() {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Icon(
                                              Icons.arrow_back_sharp,
                                              color:
                                                  ColorConstants.primaryColor,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            buyerMainController
                                                .bottomNavIndex.value = 1;
                                            Get.off(() => const BuyerLanding());
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  width: 50,
                                                  height: 40,
                                                  child: Icon(
                                                    Icons.shopping_basket_sharp,
                                                    color: ColorConstants
                                                        .primaryColor,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: -10,
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .primaryColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        buyerMainController
                                                            .cartProduct.length
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  snapshot.data
                                                      ?.data()!["cropName"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 32,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  snapshot.data?.data()![
                                                              "cropType"] ==
                                                          "hydroponic"
                                                      ? "Hydroponic"
                                                      : snapshot.data?.data()![
                                                                  "cropType"] ==
                                                              "organic"
                                                          ? "Organic"
                                                          : "Inorganic",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Icon(
                                              Icons.check,
                                              color:
                                                  ColorConstants.primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: size.width * 0.5,
                                        child: Form(
                                          key: quantityKey,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  !RegExp(r"^(?:\d*\.)?\d+$")
                                                      .hasMatch(value)) {
                                                return "Please enter Valid Quantity!";
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            controller: buyerMainController
                                                .quantityController,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            maxLines: 1,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              suffixText: "KG",
                                              suffixStyle: TextStyle(
                                                  color: Colors.black),
                                              label: Text(
                                                "Quantity",
                                                style:
                                                    TextStyle(letterSpacing: 3),
                                              ),
                                              hintText: "For 100 Gm write 0.1",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        width: size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Product Description",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              child: Text(
                                                "This Vegetable is Fresh. However, the Expiry date of this product is there.",
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              child: Text(
                                                "Expiry Date: ${snapshot.data?.data()!["cropExpiryDate"]}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 60),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 60),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // print("hello");
                            // quantityKey.currentState!.validate();
                            // if (quantityKey.currentState!.validate()) {
                            //   buyerMainController.addToCart(PlantsModel(
                            //     cropId: snapshot.data!.id,
                            //     cropName: snapshot.data!.data()!["cropName"],
                            //     cropCategory:
                            //         snapshot.data!.data()!["cropCategory"],
                            //     cropExpiryDate:
                            //         snapshot.data!.data()!["cropExpiryDate"],
                            //     cropImage: snapshot.data!.data()!["cropImage"],
                            //     cropPrice: snapshot.data!.data()!["cropPrice"],
                            //     cropType: snapshot.data!.data()!["cropType"],
                            //     farmerId: snapshot.data!.data()!["farmerId"],
                            //   ));
                            // }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              // color: ColorConstants.primaryColor,
                              // color: Colors.black,
                            ),
                            child: SizedBox(
                              height: 50,
                              width: size.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee_sharp,
                                          color: Colors.black,
                                          size: 17,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${snapshot.data?.data()!["cropPrice"]}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "Per Kg.",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      quantityKey.currentState!.validate();
                                      if (quantityKey.currentState!
                                          .validate()) {
                                        buyerMainController
                                            .addToCart(PlantsModel(
                                          cropId: snapshot.data!.id,
                                          cropName: snapshot.data!
                                              .data()!["cropName"],
                                          cropCategory: snapshot.data!
                                              .data()!["cropCategory"],
                                          cropExpiryDate: snapshot.data!
                                              .data()!["cropExpiryDate"],
                                          cropImage: snapshot.data!
                                              .data()!["cropImage"],
                                          cropPrice: snapshot.data!
                                              .data()!["cropPrice"],
                                          cropType: snapshot.data!
                                              .data()!["cropType"],
                                          farmerId: snapshot.data!
                                              .data()!["farmerId"],
                                        ));
                                      }
                                    },
                                    child: Container(
                                      width: size.width * 0.5,
                                      color: ColorConstants.primaryColor,
                                      child: const Center(
                                        child: Text(
                                          "Add To Cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: ColorConstants.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_sharp,
                  size: 25,
                ),
              ),
              const SizedBox(width: 20),
              // Text(
              //   appBarTitle,
              //   style: const TextStyle(
              //     color: Colors.black,
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
          InkWell(
            onTap: () {
              buyerMainController.bottomNavIndex.value = 1;
              Get.off(() => const BuyerLanding());
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
    );
  }
}
