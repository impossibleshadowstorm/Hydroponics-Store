import 'dart:convert';

PlantsModel plantsModelFromJson(String str) =>
    PlantsModel.fromJson(json.decode(str));

String plantsModelToJson(PlantsModel data) => json.encode(data.toJson());

class PlantsModel {
  final String cropId;
  final String cropName;
  final String cropCategory;
  final String cropExpiryDate;
  final String cropImage;
  final String cropPrice;
  final String cropType;
  final String farmerId;

  PlantsModel({
    required this.cropId,
    required this.cropName,
    required this.cropCategory,
    required this.cropExpiryDate,
    required this.cropImage,
    required this.cropPrice,
    required this.cropType,
    required this.farmerId,
  });

  factory PlantsModel.fromJson(Map<String, dynamic> json) => PlantsModel(
        cropId: json["cropId"],
        cropName: json["cropName"],
        cropCategory: json["cropCategory"],
        cropExpiryDate: json["cropExpiryDate"],
        cropImage: json["cropImage"],
        cropPrice: json["cropPrice"],
        cropType: json["cropType"],
        farmerId: json["farmerId"],
      );

  Map toJson() => {
        "cropId": cropId,
        "cropName": cropName,
        "cropCategory": cropCategory,
        "cropExpiryDate": cropExpiryDate,
        "cropImage": cropImage,
        "cropPrice": cropPrice,
        "cropType": cropType,
        "farmerId": farmerId,
      };
}
