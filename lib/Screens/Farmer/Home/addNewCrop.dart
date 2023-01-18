import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerAddCropController.dart';
import 'dart:io';

class AddNewCrop extends StatefulWidget {
  const AddNewCrop({Key? key}) : super(key: key);

  @override
  State<AddNewCrop> createState() => _AddNewCropState();
}

class _AddNewCropState extends State<AddNewCrop> {
  FarmerAddCropController farmerAddCropController =
      Get.put(FarmerAddCropController());

  final cropDataKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: ColorConstants.fadedWhiteColor,
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    customAppBar("Add New Crop"),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Form(
                            key: cropDataKey,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        farmerAddCropController
                                            .pickImage(context);
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 80,
                                          backgroundImage: farmerAddCropController
                                                  .isProfilePicPathSet.value
                                              ? FileImage(File(
                                                  farmerAddCropController
                                                      .profilePath
                                                      .value)) as ImageProvider
                                              : const AssetImage(
                                                  "assets/images/family.png"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      farmerAddCropController
                                          .profileError.value,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: farmerAddCropController.cropName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter Valid Crop Name!";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      // letterSpacing: 3,
                                      ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Crop Name",
                                      style: TextStyle(letterSpacing: 3),
                                    ),
                                    hintText: "Mango",
                                  ),
                                ),
                                TextFormField(
                                  controller:
                                      farmerAddCropController.cropCategory,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter Valid Crop Category!";
                                    }
                                    return null;
                                  },
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Crop Category",
                                      style: TextStyle(letterSpacing: 3),
                                    ),
                                    hintText:
                                        "Potato / Tomato / Mint / Coriander",
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
                                      InkWell(
                                        onTap: () {
                                          farmerAddCropController
                                              .cropType.value = 0;
                                        },
                                        splashColor: Colors.transparent,
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: farmerAddCropController
                                                          .cropType.value ==
                                                      0
                                                  ? Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              "Hydroponic",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          farmerAddCropController
                                              .cropType.value = 1;
                                        },
                                        splashColor: Colors.transparent,
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: farmerAddCropController
                                                          .cropType.value ==
                                                      1
                                                  ? Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              "Organic",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          farmerAddCropController
                                              .cropType.value = 2;
                                        },
                                        splashColor: Colors.transparent,
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: farmerAddCropController
                                                          .cropType.value ==
                                                      2
                                                  ? Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              "Inorganic",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: farmerAddCropController.cropPrice,
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
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Crop Price [Per Kg.]",
                                      style: TextStyle(letterSpacing: 3),
                                    ),
                                    hintText: "255.50",
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller:
                                      farmerAddCropController.cropExpiryDate,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[0-9]{2}/[0-9]{2}/{1}[0-9]{4}$")
                                            .hasMatch(value)) {
                                      return "Please enter Valid Expiry Date!";
                                    }
                                    return null;
                                  },
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  onTap: () async {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(DateTime.now().year,
                                          DateTime.now().month + 2),
                                    ).then((value) {
                                      if (value!.month < 10) {
                                        farmerAddCropController
                                                .cropExpiryDate.text =
                                            "${value.day}/0${value.month}/${value.year}";
                                      } else {
                                        farmerAddCropController
                                                .cropExpiryDate.text =
                                            "${value.day}/${value.month}/${value.year}";
                                      }
                                    });
                                    //
                                    // if(pickedDate != null){
                                    //   farmerAddCropController.cropExpiryDate.text =
                                    // }
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.date_range_sharp),
                                    label: Text(
                                      "Expiry Date",
                                      style: TextStyle(letterSpacing: 3),
                                    ),
                                    hintText: "24/12/2023",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                  onTap: () {
                    cropDataKey.currentState!.validate();
                    if (cropDataKey.currentState!.validate() &&
                        farmerAddCropController.isProfilePicPathSet.value) {
                      farmerAddCropController.uploadFile(context);
                    } else {
                      if (farmerAddCropController.isProfilePicPathSet.value) {
                        farmerAddCropController.profileError.value = "";
                      } else {
                        farmerAddCropController.profileError.value =
                            "Please Upload Your Product Picture!";
                      }
                    }
                  },
                  child: Container(
                    height: 40,
                    color: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        farmerAddCropController.addCropButton.value,
                        style: const TextStyle(
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
