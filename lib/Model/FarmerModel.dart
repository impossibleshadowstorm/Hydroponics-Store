import 'dart:convert';

FarmerModel farmerModelFromJson(String str) =>
    FarmerModel.fromJson(json.decode(str));

String farmerModelToJson(FarmerModel data) => json.encode(data.toJson());

class FarmerModel {
  final String aadhaarNumber;
  final String address;
  final String alternateMobileNumber;
  final String city;
  final String fullName;
  final String gstNumber;
  final String mobileNumber;
  final String profileImage;
  final String state;
  final String tanNumber;

  FarmerModel({
    required this.aadhaarNumber,
    required this.address,
    required this.alternateMobileNumber,
    required this.city,
    required this.fullName,
    required this.gstNumber,
    required this.mobileNumber,
    required this.profileImage,
    required this.state,
    required this.tanNumber,
  });

  factory FarmerModel.fromJson(Map<String, dynamic> json) => FarmerModel(
    aadhaarNumber: json["aadhaarNumber"],
    address: json["address"],
    alternateMobileNumber: json["alternateMobileNumber"],
    city: json["city"],
    fullName: json["fullName"],
    gstNumber: json["gstNumber"],
    mobileNumber: json["mobileNumber"],
    profileImage: json["profileImage"],
    state: json["state"],
    tanNumber: json["tanNumber"],
  );

  Map toJson() => {
    "aadhaarNumber": aadhaarNumber,
    "address": address,
    "alternateMobileNumber": alternateMobileNumber,
    "city": city,
    "fullName": fullName,
    "gstNumber": gstNumber,
    "mobileNumber": mobileNumber,
    "profileImage": profileImage,
    "state": state,
    "tanNumber": tanNumber,
  };
}
