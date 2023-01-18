import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../Controllers/userLocationController.dart';
import 'package:http/http.dart' as http;

class LocationEntry extends StatefulWidget {
  const LocationEntry({Key? key}) : super(key: key);

  @override
  State<LocationEntry> createState() => _LocationEntryState();
}

class _LocationEntryState extends State<LocationEntry> {
  UserLocationController userLocationController =
      Get.put(UserLocationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // userLocationController.getCurrentLocation();
    if (Platform.isIOS) {
      userLocationController.googleApiKey =
          "AIzaSyAOVx4pPWGvKdY67WzJVy6kBX-V8Ti4C6o";
    }
    if (Platform.isAndroid) {
      userLocationController.googleApiKey =
          "AIzaSyCmAUMeVuIkZGtp4ptl3_TIdB6rDUCtows";
    }

    userLocationController.addressController.addListener(() {
      if(userLocationController.addressController.text.length > 3) {
        userLocationController.addressTypingOnChange();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Enter your area or apartment name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value){

                },
                controller: userLocationController.addressController,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Try Ghantaghar',
                  hintStyle: const TextStyle(fontSize: 16),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black26,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.my_location_outlined,
                    color: ColorConstants.primaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Use My Current Location",
                    style: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userLocationController.placesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: userLocationController.placesList[index]
                          ['description'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
