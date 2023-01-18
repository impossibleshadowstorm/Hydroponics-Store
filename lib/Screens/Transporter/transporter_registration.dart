import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroponics_store/Screens/Common/pinUserLocation.dart';
import 'package:hydroponics_store/Screens/Farmer/farmer_landing.dart';
import 'dart:io';
import '../../Constants/colors.dart';
import '../../Controllers/Transporter/transporterRegistrationFormController.dart';
import '../../Controllers/userModeController.dart';
import 'package:get/get.dart';

class TransporterRegistration extends StatefulWidget {
  const TransporterRegistration({Key? key}) : super(key: key);

  @override
  State<TransporterRegistration> createState() =>
      _TransporterRegistrationState();
}

class _TransporterRegistrationState extends State<TransporterRegistration> {
  TransporterRegistrationFormController transporterRegistrationFormController =
      Get.put(TransporterRegistrationFormController());
  UserModeController userModeController = Get.find();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Profile Picture
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                transporterRegistrationFormController
                                    .pickImage(context);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: ColorConstants.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage:
                                      transporterRegistrationFormController
                                              .isProfilePicPathSet.value
                                          ? FileImage(File(
                                              transporterRegistrationFormController
                                                  .profilePath
                                                  .value)) as ImageProvider
                                          : const AssetImage(
                                              "assets/images/family.png"),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            transporterRegistrationFormController
                                        .profileError.value ==
                                    ""
                                ? const Text(
                                    "Change Profile Picture",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    transporterRegistrationFormController
                                        .profileError.value,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      // Fields
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Valid Name!";
                          }
                          return null;
                        },
                        controller: transporterRegistrationFormController
                            .transporterFullName,
                        maxLines: 1,
                        // keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text("Full Name"),
                          hintText: "John Amanda",
                        ),
                      ),
                      TextFormField(
                        controller: transporterRegistrationFormController
                            .transporterMobileNumber,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        enabled: false,
                        maxLines: 1,
                        decoration: InputDecoration(
                          label: Text(
                            userModeController.getRightData()["phone"].text,
                            style: const TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                            return "Please enter Valid Mobile Number!";
                          }
                          return null;
                        },
                        controller: transporterRegistrationFormController
                            .transporterAlternateMobileNumber,
                        maxLines: 1,
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            "Alternate Mobile Number",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "989898XXXX",
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$")
                                  .hasMatch(value)) {
                            return "Please enter Valid Aadhaar Number!";
                          }
                          return null;
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        maxLength: 12,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: transporterRegistrationFormController
                            .transporterAadhaarNumber,
                        decoration: const InputDecoration(
                          label: Text(
                            "Aadhaar Number",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "98989898XXXX",
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z]{4}[0-9]{5}[a-zA-Z]{1}?$")
                                  .hasMatch(value)) {
                            return "Please enter Valid TAN Number!";
                          }
                          return null;
                        },
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        controller: transporterRegistrationFormController
                            .transporterTANNumber,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            "TAN Number",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "AAXX999XXA",
                        ),
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r"^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{0}[0-9a-zA-Z]{1}$")
                                  .hasMatch(value)) {
                            return "Please enter Valid GST Number!";
                          }
                          return null;
                        },
                        controller: transporterRegistrationFormController
                            .transporterGSTNumber,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        maxLength: 15,
                        textCapitalization: TextCapitalization.characters,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            "GST Number",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "11AAXXX11XXA1A5",
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Valid Address!";
                                  }
                                  return null;
                                },
                                controller:
                                    transporterRegistrationFormController
                                        .transporterAddress,
                                style: const TextStyle(
                                  letterSpacing: 3,
                                ),
                                enabled: false,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Address",
                                    style: TextStyle(letterSpacing: 1),
                                  ),
                                  hintText: "Flat, Street, Locality",
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.to(() => const PinUserLocation());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                height: 50,
                                width: 50,
                                child: const Icon(
                                  Icons.my_location_sharp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      TextFormField(
                        enabled: false,
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Valid City!";
                          }
                          return null;
                        },
                        controller: transporterRegistrationFormController
                            .transporterCity,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            "City",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "Dehradun",
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        validator: (value) {
                          if (value == "") {
                            return "Please enter Valid State!";
                          }
                          return null;
                        },
                        controller: transporterRegistrationFormController
                            .transporterState,
                        style: const TextStyle(
                          letterSpacing: 3,
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            "State",
                            style: TextStyle(letterSpacing: 1),
                          ),
                          hintText: "Uttarakhand",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              formKey.currentState!.validate();
              if (formKey.currentState!.validate() &&
                  transporterRegistrationFormController
                      .isProfilePicPathSet.value) {
                transporterRegistrationFormController.uploadFile(context);
              } else {
                transporterRegistrationFormController.profileError.value =
                    "Please Upload Profile Picture!";
              }
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(20.0),
              backgroundColor:
                  MaterialStateProperty.all(ColorConstants.primaryColor),
            ),
            child: Text(
              transporterRegistrationFormController.saveButton.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        );
      },
    );
  }
}
