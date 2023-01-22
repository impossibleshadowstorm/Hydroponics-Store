import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';

import '../../../Constants/colors.dart';
import '../../../Controllers/userModeController.dart';

class ChooseTransporter extends StatefulWidget {
  const ChooseTransporter({Key? key}) : super(key: key);

  @override
  State<ChooseTransporter> createState() => _ChooseTransporterState();
}

class _ChooseTransporterState extends State<ChooseTransporter> {
  UserModeController userModeController = Get.find();
  BuyerMainController buyerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar('Transporters'),
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
      future: FirebaseFirestore.instance.collection("transporters").get(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
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
                        image: NetworkImage(
                            snapshot.data!.docs[index]["profileImage"]),
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
                              snapshot.data!.docs[index]["fullName"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              "100 Rs.",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              buyerMainController.transporterSelected.value = true;
                              buyerMainController.transporterCost.value = 100.0;
                              Get.back();
                              // Get.to(() => BuyerCropListScreen(
                              //   cropType: "hydroponic",
                              //   cropCategory: cropTypeData[index]
                              //   ["cropCategory"],
                              // ));
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
                                "Hire",
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
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              height: 30,
              width: 30,
              child: const Icon(Icons.arrow_back_sharp),
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
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: const [
          //       SizedBox(
          //         width: 50,
          //         height: 40,
          //         child: Icon(
          //           Icons.filter_alt_sharp,
          //           size: 30,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
