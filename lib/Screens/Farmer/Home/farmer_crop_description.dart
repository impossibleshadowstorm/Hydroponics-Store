import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerMainController.dart';

class CropDescription extends StatefulWidget {
  final productId;

  const CropDescription({Key? key, required this.productId}) : super(key: key);

  @override
  State<CropDescription> createState() => _CropDescriptionState();
}

class _CropDescriptionState extends State<CropDescription> {
  FarmerMainController farmerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar("Plant Details"),
              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection("products")
                    .doc(widget.productId)
                    .get(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot.data?.data()!["cropName"]);
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data?.data()!["cropImage"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Valid Crop Name!";
                                  }
                                  return null;
                                },
                                enabled: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: Text(
                                    snapshot.data?.data()!["cropName"],
                                    style: const TextStyle(letterSpacing: 3),
                                  ),
                                  hintText: snapshot.data?.data()!["cropName"],
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Valid Crop Name!";
                                  }
                                  return null;
                                },
                                enabled: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: Text(
                                    snapshot.data?.data()!["cropCategory"],
                                    style: const TextStyle(letterSpacing: 3),
                                  ),
                                  hintText: snapshot.data?.data()!["cropName"],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text("Crop Type"),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 20,
                                            height: 20,
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                            )),
                                        const SizedBox(width: 5),
                                        Text(
                                          snapshot.data?.data()!["cropName"] ==
                                                  "hydroponic"
                                              ? "Hydroponic"
                                              : snapshot.data?.data()![
                                                          "cropName"] ==
                                                      "organic"
                                                  ? "Organic"
                                                  : "Inorganic",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                enabled: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Valid Crop Price!";
                                  }
                                  return null;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: Text(
                                    "${snapshot.data?.data()!["cropPrice"]} per Kg.",
                                    style: const TextStyle(letterSpacing: 3),
                                  ),
                                  hintText:
                                      "${snapshot.data?.data()!["cropPrice"]}",
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                enabled: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Valid Expiry Date!";
                                  }
                                  return null;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: Text(
                                    "${snapshot.data?.data()!["cropExpiryDate"]}",
                                    style: const TextStyle(letterSpacing: 3),
                                  ),
                                  hintText: "24/12/2023",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          SizedBox(
            height: 40,
            child: Row(
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
                Text(
                  appBarTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    color: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Center(
                      child: Text(
                        "Edit Crop",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
