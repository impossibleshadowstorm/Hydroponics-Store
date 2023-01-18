import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';

class BuyerPlantDescription extends StatefulWidget {
  const BuyerPlantDescription({Key? key}) : super(key: key);

  @override
  State<BuyerPlantDescription> createState() => _BuyerPlantDescriptionState();
}

class _BuyerPlantDescriptionState extends State<BuyerPlantDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar("Plant Details"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/family.png"),
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
                      style: const TextStyle(
                          // letterSpacing: 3,
                          ),
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text(
                          "Plant Name",
                          style: TextStyle(letterSpacing: 3),
                        ),
                        hintText: "Mango",
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Plant Type"),
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
                              const Text(
                                "Hydroponic Plant",
                                style: TextStyle(
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextFormField(
                              enabled: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter Valid Crop Price!";
                                }
                                return null;
                              },
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text(
                                  " 520",
                                  style: TextStyle(letterSpacing: 3),
                                ),
                                hintText: "255.50",
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter Valid Crop Price!";
                                }
                                return null;
                              },
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text(
                                  "   Kg",
                                  style: TextStyle(
                                    letterSpacing: 3,
                                    fontSize: 14,
                                  ),
                                ),
                                hintText: "Kg / Gm / Piece",
                              ),
                            ),
                          ),
                        ],
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
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text(
                          "24/12/2023",
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
        ],
      ),
    );
  }
}
