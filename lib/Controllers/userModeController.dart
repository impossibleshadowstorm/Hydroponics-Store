import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hydroponics_store/Screens/Auth/Mode/userModeSelection.dart';
import 'package:hydroponics_store/Screens/Buyer/buyer_landing.dart';
import 'package:hydroponics_store/Screens/Buyer/buyer_registration.dart';
import 'package:hydroponics_store/Screens/Farmer/farmer_landing.dart';
import 'package:hydroponics_store/Screens/Farmer/farmer_registration.dart';
import 'package:hydroponics_store/Screens/Transporter/transporter_landing.dart';
import 'package:hydroponics_store/Screens/Transporter/transporter_registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Auth/Mode/buyer_mode.dart';
import '../Screens/Auth/Mode/farmer_mode.dart';
import '../Screens/Auth/Mode/transporter_mode.dart';

class UserModeController extends GetxController {
  var bottomNavIndex = 0.obs;

  List<Widget> bottomNavigationPages = [
    const BuyerMode(),
    const FarmerMode(),
    const TransporterMode(),
  ];
  List<Widget> verifiedLandingPages = [
    const BuyerLanding(),
    const FarmerLanding(),
    const TransporterLanding(),
  ];
  List<Widget> verifiedRegistrationPages = [
    const BuyerRegistration(),
    const FarmerRegistration(),
    const TransporterRegistration(),
  ];
  List<GButton> iconsList = [
    const GButton(
      icon: Icons.local_convenience_store_rounded,
      text: "Buyer",
    ),
    const GButton(
      icon: Icons.construction_sharp,
      text: "Farmer",
    ),
    const GButton(
      icon: Icons.fire_truck_sharp,
      text: "Transporter",
    ),
  ];
  List pagesDescriptionList = [
    {
      "name": "Buyer",
      "image": "assets/images/buyer-login.json",
      "collectionName": "buyer",
    },
    {
      "name": "Farmer",
      "image": "assets/images/farmer-login.json",
      "collectionName": "farmer",
    },
    {
      "name": "Transporter",
      "image": "assets/images/transporter-login.json",
      "collectionName": "transporter",
    },
  ];

  // var requestedOtp = false.obs;
  // var progressIndicator = false.obs;
  // var error = "".obs;
  // var countryCode = "".obs;

  var buyerRequestedOtp = false.obs;
  var buyerProgressIndicator = false.obs;
  var buyerError = "".obs;
  var buyerCountryCode = "".obs;

  var farmerRequestedOtp = false.obs;
  var farmerProgressIndicator = false.obs;
  var farmerError = "".obs;
  var farmerCountryCode = "".obs;

  var transporterRequestedOtp = false.obs;
  var transporterProgressIndicator = false.obs;
  var transporterError = "".obs;
  var transporterCountryCode = "".obs;

  String buyerVerify = "";
  String farmerVerify = "";
  String transporterVerify = "";

  // TextEditingController otpField = TextEditingController();
  TextEditingController buyerOtpField = TextEditingController();
  TextEditingController farmerOtpField = TextEditingController();
  TextEditingController transporterOtpField = TextEditingController();

  // TextEditingController phoneNumber = TextEditingController();
  TextEditingController buyerPhoneNumber = TextEditingController();
  TextEditingController farmerPhoneNumber = TextEditingController();
  TextEditingController transporterPhoneNumber = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  getRightData() {
    if (bottomNavIndex.value == 0) {
      return {
        "indicator": buyerProgressIndicator,
        "error": buyerError,
        "otp": buyerOtpField,
        "phone": buyerPhoneNumber,
        "collectionName": "buyer",
        "verify": buyerVerify,
      };
    } else if (bottomNavIndex.value == 1) {
      return {
        "indicator": farmerProgressIndicator,
        "error": farmerError,
        "otp": farmerOtpField,
        "phone": farmerPhoneNumber,
        "collectionName": "farmer",
        "verify": farmerVerify,
      };
    } else if (bottomNavIndex.value == 2) {
      return {
        "indicator": transporterProgressIndicator,
        "error": transporterError,
        "otp": transporterOtpField,
        "phone": transporterPhoneNumber,
        "collectionName": "transporter",
        "verify": transporterVerify,
      };
    }
  }

  Future<void> loginUser() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: getRightData()["verify"],
          smsCode: getRightData()["otp"].text);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      getRightData()["error"].value = "Login Successful, Please Wait";

      var db = await FirebaseFirestore.instance
            .collection("users")
            .doc(pagesDescriptionList[bottomNavIndex.value]["collectionName"])
            .collection(getRightData()["phone"].text)
            .get();

      getRightData()["indicator"].value = false;

      print(db.docs.length);
      if (db.docs.isEmpty) {
        Get.offAll(() => verifiedRegistrationPages[bottomNavIndex.value]);
      }
      else{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", auth.currentUser!.uid);
        await prefs.setInt("bottomNavIndex", bottomNavIndex.value);
        await prefs.setString("phoneNumber", getRightData()["phone"].text);
        Get.offAll(() => verifiedLandingPages[bottomNavIndex.value]);
      }
    } catch (e) {
      print(e);
      getRightData()["error"].value = "Invalid OTP";
      getRightData()["indicator"].value = false;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    buyerOtpField.text = "";
    farmerOtpField.text = "";
    transporterOtpField.text = "";

    buyerPhoneNumber.text = "";
    farmerPhoneNumber.text = "";
    transporterPhoneNumber.text = "";

    buyerRequestedOtp.value = false;
    buyerProgressIndicator.value = false;
    buyerError.value = "";
    buyerCountryCode.value = "";

    farmerRequestedOtp.value = false;
    farmerProgressIndicator.value = false;
    farmerError.value = "";
    farmerCountryCode.value = "";

    transporterRequestedOtp.value = false;
    transporterProgressIndicator.value = false;
    transporterError.value = "";
    transporterCountryCode.value = "";

    Get.offAll(() => const UserModeSelection());
  }

  changePage(index) {
    bottomNavIndex.value = index;
    getRightData()["indicator"].value = false;
    getRightData()["error"].value = "";
    getRightData()["otp"].text = "";
    getRightData()["phone"].text = "";
  }

  collectionQuerySnapshot(collectionName) {
    var products = FirebaseFirestore.instance.collection(collectionName).get();

    return products;
  }
}
