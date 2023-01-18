// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:hydroponics_store/Screens/Waste/HydroponicsStore/authController.dart';
// import 'package:lottie/lottie.dart';
//
// class SimpleLogin extends StatefulWidget {
//   const SimpleLogin({Key? key}) : super(key: key);
//
//   @override
//   State<SimpleLogin> createState() => _SimpleLoginState();
// }
//
// class _SimpleLoginState extends State<SimpleLogin> {
//   AuthController authController = Get.put(AuthController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         return Scaffold(
//           backgroundColor: Colors.purple.shade400,
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.bottomCenter,
//                     padding: const EdgeInsets.all(20),
//                     height: MediaQuery.of(context).size.height * 0.30,
//                     width: MediaQuery.of(context).size.width,
//                     child: Container(
//                       padding: const EdgeInsets.all(20),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       height: 150,
//                       width: 150,
//                       child: const Image(
//                         image: AssetImage("assets/images/family.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Select a User Type",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             authController.changeModeSelector(1);
//                           },
//                           splashColor: Colors.transparent,
//                           overlayColor:
//                               MaterialStateProperty.all(Colors.transparent),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 20,
//                                 height: 20,
//                                 padding: const EdgeInsets.all(5),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: authController.modeSelector.value == 1
//                                     ? Container(
//                                         height: 10,
//                                         width: 10,
//                                         decoration: const BoxDecoration(
//                                           color: Colors.orange,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       )
//                                     : null,
//                               ),
//                               const SizedBox(width: 5),
//                               const Text(
//                                 "Buyer",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 30),
//                         InkWell(
//                           onTap: () {
//                             authController.changeModeSelector(2);
//                           },
//                           splashColor: Colors.transparent,
//                           overlayColor:
//                               MaterialStateProperty.all(Colors.transparent),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 20,
//                                 height: 20,
//                                 padding: const EdgeInsets.all(5),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: authController.modeSelector.value == 2
//                                     ? Container(
//                                         height: 10,
//                                         width: 10,
//                                         decoration: const BoxDecoration(
//                                           color: Colors.orange,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       )
//                                     : null,
//                               ),
//                               const SizedBox(width: 5),
//                               const Text(
//                                 "Farmer",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Editing Field
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       autofocus: true,
//                       controller: authController.phoneController,
//                       enabled: authController.phoneEnabled.value,
//                       decoration: InputDecoration(
//                         labelText: "Mobile Number",
//                         fillColor: Colors.white,
//                         filled: true,
//                         labelStyle: TextStyle(
//                           color: Colors.black.withOpacity(0.8),
//                         ),
//                       ),
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // OTP Field
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextFormField(
//                       autofocus: true,
//                       controller: authController.otpController,
//                       maxLength: 6,
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       showCursor: false,
//                       enabled: authController.otpEnabled.value,
//                       decoration: InputDecoration(
//                         labelText: "OTP",
//                         fillColor: Colors.white,
//                         filled: true,
//                         labelStyle: TextStyle(
//                           color: Colors.black.withOpacity(0.8),
//                         ),
//                       ),
//                       style: const TextStyle(
//                           color: Colors.black, letterSpacing: 20),
//                     ),
//                   ),
//                   // Error
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       alignment: Alignment.center,
//                       child: Text(
//                         authController.otpError.value,
//                         style: const TextStyle(
//                           color: Colors.yellow,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   authController.progressIndicator.value
//                       ? const SizedBox(
//                           height: 100,
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         )
//                       : const SizedBox(height: 100),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: InkWell(
//                       onTap: () async {
//                         if (authController.otpEnabled.value) {
//                           authController.progressIndicator.value = true;
//                           authController.loginUser();
//                         } else {
//                           authController.progressIndicator.value = true;
//                           await FirebaseAuth.instance.verifyPhoneNumber(
//                             phoneNumber:
//                                 "+91${authController.phoneController.text}",
//                             verificationCompleted:
//                                 (PhoneAuthCredential credential) {},
//                             verificationFailed: (FirebaseAuthException e) {},
//                             codeSent:
//                                 (String verificationId, int? resendToken) {
//                               authController.verify = verificationId;
//                               authController.progressIndicator.value = false;
//                               authController.phoneEnabled.value = false;
//                               authController.otpEnabled.value = true;
//                             },
//                             codeAutoRetrievalTimeout:
//                                 (String verificationId) {},
//                           );
//                         }
//                       },
//                       child: Container(
//                         height: 45,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           color: Color(0XFF3700B2),
//                         ),
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           authController.otpEnabled.value
//                               ? "Verify OTP"
//                               : "Request OTP",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       alignment: Alignment.center,
//                       child: const Text(
//                         "with Login you are accepting out terms and conditions sbd",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
