import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants/colors.dart';

class TransporterMode extends StatefulWidget {
  const TransporterMode({Key? key}) : super(key: key);

  @override
  State<TransporterMode> createState() => _TransporterModeState();
}

class _TransporterModeState extends State<TransporterMode> {
  UserModeController userModeController = Get.find();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      child: Lottie.asset(
                        userModeController.pagesDescriptionList[
                            userModeController.bottomNavIndex.value]["image"],
                        animate: true,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userModeController.pagesDescriptionList[
                              userModeController.bottomNavIndex.value]["name"] +
                          "'s Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Enter your phone number to continue, we will send OTP to verify.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Visibility(
                          visible:
                              userModeController.transporterRequestedOtp.value,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  maxLength: 6,
                                  textAlign: TextAlign.center,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  controller:
                                      userModeController.transporterOtpField,
                                  autofocus: false,
                                  smartDashesType: SmartDashesType.enabled,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  showCursor: false,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  userModeController.transporterError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                              !userModeController.transporterRequestedOtp.value,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffeeeeee),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.13),
                              ),
                            ),
                            child: Stack(
                              children: [
                                InternationalPhoneNumberInput(
                                  onInputChanged: (value) {
                                    userModeController.transporterCountryCode
                                        .value = value.dialCode!;
                                  },
                                  initialValue: number,
                                  autoValidateMode: AutovalidateMode.always,
                                  textFieldController:
                                      userModeController.transporterPhoneNumber,
                                  cursorColor: Colors.black,
                                  formatInput: false,
                                  autoFocus: false,
                                  selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  inputDecoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 15, left: 0),
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 90,
                                  top: 8,
                                  bottom: 8,
                                  child: Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.black.withOpacity(
                                      0.13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    userModeController.transporterProgressIndicator.value
                        ? const SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox(height: 100),
                    Visibility(
                        visible:
                            userModeController.transporterRequestedOtp.value,
                        child: Column(
                          children: [
                            MaterialButton(
                              splashColor: Colors.transparent,
                              highlightColor: ColorConstants.primaryColor,
                              onPressed: () async {
                                userModeController
                                    .transporterProgressIndicator.value = true;
                                userModeController.loginUser();
                              },
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              minWidth: double.infinity,
                              child: const Text(
                                "Verify OTP",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                userModeController
                                    .transporterRequestedOtp.value = false;
                              },
                              child: Text(
                                "Edit Phone Number ?",
                                style: TextStyle(
                                  color: ColorConstants.darkSkinColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Visibility(
                      visible:
                          !userModeController.transporterRequestedOtp.value,
                      child: MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: ColorConstants.primaryColor,
                        onPressed: () async {
                          userModeController
                              .transporterProgressIndicator.value = true;
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: userModeController
                                    .transporterCountryCode +
                                userModeController.transporterPhoneNumber.text,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              userModeController.transporterVerify = verificationId;
                              userModeController
                                  .transporterProgressIndicator.value = false;
                              userModeController.transporterRequestedOtp.value =
                                  true;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        minWidth: double.infinity,
                        child: const Text(
                          "Request OTP",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
}
