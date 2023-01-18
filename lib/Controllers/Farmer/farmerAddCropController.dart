import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../Constants/colors.dart';
import '../../Screens/Farmer/Home/farmer_home_screen.dart';
import '../userModeController.dart';

class FarmerAddCropController extends GetxController {
  UserModeController userModeController = Get.find();

  TextEditingController cropName = TextEditingController();
  TextEditingController cropCategory = TextEditingController();
  TextEditingController cropPrice = TextEditingController();
  TextEditingController cropQuantity = TextEditingController();
  TextEditingController cropExpiryDate = TextEditingController();

  var cropType = 0.obs;

  var isProfilePicPathSet = false.obs;
  var profilePath = "".obs;
  var productImageName = "";
  var profileError = "Change Product Picture".obs;
  var profileUploadedUrl = "";
  var addCropButton = "Add Crop".obs;
  final picker = ImagePicker();
  File? image;

  void setProfileImagePath(String path, String name) {
    profilePath.value = path;
    isProfilePicPathSet.value = true;
    productImageName = name;
    profileError = "".obs;
  }

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
    final storagePath =
        "products/${cropName.text + userModeController.getRightData()["phone"].text}";
    final file = File(profilePath.value);

    final ref = FirebaseStorage.instance.ref().child(storagePath);
    addCropButton.value = "Please Wait...";
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
      Get.back();
    });
    final url = await snapshot.ref.getDownloadURL();
    profileUploadedUrl = url;

    uploadTask = null;
    addDataToFirebase();
    Get.off(() => const FarmerHomeScreen());
  }

  getCropType() {
    if (cropType.value == 0) {
      return "hydroponic";
    } else if (cropType.value == 1) {
      return "organic";
    } else {
      return "inorganic";
    }
  }

  Future addDataToFirebase() async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(cropName.text.toLowerCase() +
            DateTime.now().millisecondsSinceEpoch.toString())
        .set({
      "cropName": cropName.text,
      "cropCategory": cropCategory.text,
      "cropType": getCropType(),
      "cropPrice": cropPrice.text,
      "cropQuantity": cropQuantity.text,
      "cropExpiryDate": cropExpiryDate.text,
      "cropImage": profileUploadedUrl,
      "farmerId": userModeController.getRightData()["phone"].text,
    });
  }
}
