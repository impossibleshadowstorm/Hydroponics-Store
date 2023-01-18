// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hydroponics_store/Screens/Buyer/buyer_landing.dart';
// import 'package:hydroponics_store/Screens/Farmer/farmer_landing.dart';
//
// class AuthController extends GetxController {
//   var modeSelector = 1.obs;
//
//   changeModeSelector(value) {
//     modeSelector.value = value;
//     phoneEnabled.value = true;
//     otpEnabled.value = false;
//     otpError.value = "";
//     progressIndicator.value = false;
//     otpController.text = "";
//     phoneController.text = "";
//   }
//
//   var otpError = "".obs;
//   var buyerOtpError = "".obs;
//   var farmerOtpError = "".obs;
//   String verify = "";
//
//   var phoneEnabled = true.obs;
//
//   var otpEnabled = false.obs;
//
//   var progressIndicator = false.obs;
//
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController buyerPhoneController = TextEditingController();
//   TextEditingController farmerPhoneController = TextEditingController();
//
//   TextEditingController otpController = TextEditingController();
//   TextEditingController buyerOtpController = TextEditingController();
//   TextEditingController farmerOtpController = TextEditingController();
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   Future<void> loginUser() async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verify, smsCode: otpController.text);
//
//       // Sign the user in (or link) with the credential
//       await auth.signInWithCredential(credential);
//       otpError.value = "Login Successful";
//       progressIndicator.value = false;
//
//       if (modeSelector.value == 1) {
//         Get.offAll(() => const BuyerLanding());
//       } else if (modeSelector.value == 2) {
//         Get.offAll(() => const FarmerLanding());
//       }
//     } catch (e) {
//       otpError.value = "Invalid OTP";
//       progressIndicator.value = false;
//     }
//   }
// }
