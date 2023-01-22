import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:hydroponics_store/Screens/Auth/Mode/userModeSelection.dart';

import '../../../Constants/colors.dart';

class BuyerProfileScreen extends StatefulWidget {
  const BuyerProfileScreen({Key? key}) : super(key: key);

  @override
  State<BuyerProfileScreen> createState() => _BuyerProfileScreenState();
}

class _BuyerProfileScreenState extends State<BuyerProfileScreen> {
  UserModeController userModeController = Get.find();
  BuyerMainController buyerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffDFE1E6),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .doc("buyer")
                  .collection(userModeController.getRightData()["phone"].text)
                  .doc("details")
                  .get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.18,
                        width: size.width,
                        child: Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data?.data()!["profileImage"]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: -10,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstants
                                            .newGreyBackgroundColor,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data?.data()!["fullName"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "+91 ${snapshot.data?.data()!["mobileNumber"]}",
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "+91 ${snapshot.data?.data()!["alternateMobileNumber"]}",
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
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
                      const SizedBox(height: 20),
                      // GST TAN
                      Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "GST",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data?.data()!["gstNumber"],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "TAN",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data?.data()!["tanNumber"],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
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
                      const SizedBox(height: 20),
                      // Address Box
                      Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Address",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            snapshot.data?.data()!["address"],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "State",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data?.data()!["state"],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                          size: 20,
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
                      const SizedBox(height: 20),
                      //Logout Button
                      InkWell(
                        onTap: () {
                          userModeController.signOut();
                          Get.offAll(() => const UserModeSelection());
                        },
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                color: Colors.red.shade600,
                                ),
                                child: const Icon(
                                  Icons.power_settings_new_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Logout",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
        ),
      ),
    );
  }
}
