import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:image_picker/image_picker.dart';

class FarmerRegistrationFormController extends GetxController {
  UserModeController userModeController = Get.find();

  TextEditingController farmerFullName = TextEditingController();
  TextEditingController farmerMobileNumber = TextEditingController();
  TextEditingController farmerAlternateMobileNumber = TextEditingController();
  TextEditingController farmerAadhaarNumber = TextEditingController();
  TextEditingController farmerTANNumber = TextEditingController();
  TextEditingController farmerGSTNumber = TextEditingController();
  TextEditingController farmerAddress = TextEditingController();
  TextEditingController farmerCity = TextEditingController();
  TextEditingController farmerState = TextEditingController();

  var isProfilePicPathSet = false.obs;
  var profilePath = "".obs;
  var profileImageName = "";
  var profileError = "".obs;
  var profileUploadedUrl = "";
  var saveButton = "Save".obs;

  void setProfileImagePath(String path, String name) {
    profilePath.value = path;
    isProfilePicPathSet.value = true;
    profileImageName = name;
  }

  void setAddress(String? address, String? city, String? state) {
    farmerAddress.text = address!;
    farmerCity.text = city!;
    farmerState.text = state!;
  }

  final picker = ImagePicker();
  File? image;

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setProfileImagePath(pickedFile.path, pickedFile.name);
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  void pickImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  title: const Text("Camera"),
                ),
                ListTile(
                  onTap: () {
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.image,
                    color: ColorConstants.primaryColor,
                  ),
                  title: const Text("Gallery"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  UploadTask? uploadTask;

  Future uploadFile(context) async {
    final storagePath = "profiles/$profileImageName";
    final file = File(profilePath.value);

    final ref = FirebaseStorage.instance.ref().child(storagePath);
    saveButton.value = "Please Wait...";
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
      Get.back();
    });
    final url = await snapshot.ref.getDownloadURL();
    profileUploadedUrl = url;

    uploadTask = null;
    addDataToFirebase();
    Get.offAll(() => userModeController
        .verifiedLandingPages[userModeController.bottomNavIndex.value]);
  }

  Future addDataToFirebase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userModeController
                .pagesDescriptionList[userModeController.bottomNavIndex.value]
            ["collectionName"])
        .collection(userModeController.getRightData()["phone"].text)
        .doc("details")
        .set({
      "fullName": farmerFullName.text,
      "mobileNumber": userModeController.getRightData()["phone"].text,
      "alternateMobileNumber": farmerAlternateMobileNumber.text,
      "aadhaarNumber": farmerAadhaarNumber.text,
      "gstNumber": farmerGSTNumber.text,
      "tanNumber": farmerTANNumber.text,
      "address": farmerAddress.text,
      "city": farmerCity.text,
      "state": farmerState.text,
      "profileImage": profileUploadedUrl,
    });
  }
}
