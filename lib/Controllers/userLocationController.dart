import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerRegistrationFormController.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerRegistrationFormController.dart';
import 'package:hydroponics_store/Controllers/Transporter/transporterRegistrationFormController.dart';
import 'package:hydroponics_store/Controllers/userModeController.dart';
import 'package:location/location.dart' as loc;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class UserLocationController extends GetxController {
  UserModeController userModeController = Get.find();

  // FarmerRegistrationFormController farmerRegistrationFormController =
  //     Get.find();
  // BuyerRegistrationFormController buyerRegistrationFormController = Get.find();
  // TransporterRegistrationFormController transporterRegistrationFormController =
  //     Get.find();

  LatLng? destLocation = LatLng(30.72650102472271, 76.65063246146788);
  var cameraLocation = LatLng(30.72650102472271, 76.65063246146788).obs;
  loc.Location location = loc.Location();
  loc.LocationData? _currentPosition;
  final Completer<GoogleMapController?> mapController = Completer();
  var address = "".obs;
  String googleApiKey = "";

  // Type Address based Search
  var uuid = const Uuid();
  var sessionToken = "122344".obs;
  TextEditingController addressController = TextEditingController();
  List<dynamic> placesList = [].obs;

  void addressTypingOnChange() async {
    if (sessionToken.value == null) {
      sessionToken.value = uuid.v4();
    }
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=${addressController.text}&key=${googleApiKey}&sessiontoken=${sessionToken}';

    var response = await http.get(Uri.parse(request));

    // print(response.body.toString());
    if (response.statusCode == 200) {
      placesList = jsonDecode(response.body.toString())["predictions"];
    } else {
      throw Exception("Failed to load data");
    }
  }

  changeLatLong(lat, long) {
    destLocation = LatLng(lat, long);
    cameraLocation.value = LatLng(lat, long);
  }

  getAddressFromLatLng() async {
    try {
      // GeoData data = await Geocoder2.getDataFromCoordinates(
      //   latitude: destLocation!.latitude,
      //   longitude: destLocation!.longitude,
      //   googleMapApiKey: googleApiKey,
      // );
      // address.value = data.address;
      List<Placemark> placemarks = await placemarkFromCoordinates(
          destLocation!.latitude, destLocation!.longitude);

      if (userModeController.bottomNavIndex.value == 0) {
        BuyerRegistrationFormController buyerRegistrationFormController =
            Get.find();
        buyerRegistrationFormController.setAddress(
            "${placemarks[0].name}, ${placemarks[0].subLocality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}, ${placemarks[0].postalCode}, ${placemarks[0].country}",
            "${placemarks[0].locality}",
            "${indianStateCode[placemarks[0].administrativeArea]}");
      } else if (userModeController.bottomNavIndex.value == 1) {
        FarmerRegistrationFormController farmerRegistrationFormController =
            Get.find();
        farmerRegistrationFormController.setAddress(
            "${placemarks[0].name}, ${placemarks[0].subLocality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}, ${placemarks[0].postalCode}, ${placemarks[0].country}",
            "${placemarks[0].locality}",
            "${indianStateCode[placemarks[0].administrativeArea]}");
      } else {
        TransporterRegistrationFormController
            transporterRegistrationFormController = Get.find();
        transporterRegistrationFormController.setAddress(
            "${placemarks[0].name}, ${placemarks[0].subLocality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}, ${placemarks[0].postalCode}, ${placemarks[0].country}",
            "${placemarks[0].locality}",
            "${indianStateCode[placemarks[0].administrativeArea]}");
      }

      addressController.text = address.value;
    } catch (e) {
      print(e);
    }
  }

  getCurrentLocation() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    final GoogleMapController? controller = await mapController.future;

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    if (permissionGranted == loc.PermissionStatus.granted) {
      location.changeSettings(accuracy: loc.LocationAccuracy.high);

      _currentPosition = await location.getLocation();
      controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
                _currentPosition!.latitude!, _currentPosition!.longitude!),
            zoom: 16,
          ),
        ),
      );
      destLocation =
          LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
    }
  }

  var indianStateCode = {
    "AN": "Andaman and Nicobar Islands",
    "AP": "Andhra Pradesh",
    "AR": "Arunachal Pradesh",
    "AS": "Assam",
    "BR": "Bihar",
    "CG": "Chandigarh",
    "CH": "Chhattisgarh",
    "DN": "Dadra and Nagar Haveli",
    "DD": "Daman and Diu",
    "DL": "Delhi",
    "GA": "Goa",
    "GJ": "Gujarat",
    "HR": "Haryana",
    "HP": "Himachal Pradesh",
    "JK": "Jammu and Kashmir",
    "JH": "Jharkhand",
    "KA": "Karnataka",
    "KL": "Kerala",
    "LA": "Ladakh",
    "LD": "Lakshadweep",
    "MP": "Madhya Pradesh",
    "MH": "Maharashtra",
    "MN": "Manipur",
    "ML": "Meghalaya",
    "MZ": "Mizoram",
    "NL": "Nagaland",
    "OR": "Odisha",
    "PY": "Puducherry",
    "PB": "Punjab",
    "RJ": "Rajasthan",
    "SK": "Sikkim",
    "TN": "Tamil Nadu",
    "TS": "Telangana",
    "TR": "Tripura",
    "UP": "Uttar Pradesh",
    "UK": "Uttarakhand",
    "WB": "West Bengal"
  };
}
