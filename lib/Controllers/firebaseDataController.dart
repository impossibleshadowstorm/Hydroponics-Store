// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
// import '../Model/plantsModel.dart';
//
// class FirebaseDataController extends GetxController {
//   List<PlantsModel> plantProducts = [];
//   final categoryFilterNumber = 0.obs;
//
//   changeCategoryFilterName(index) {
//     categoryFilterNumber.value = index;
//   }
//
//   collectionQuerySnapshot(collectionName) {
//     var products = FirebaseFirestore.instance.collection(collectionName).get();
//
//     return products;
//   }
//
//   fetchPlantProducts() async {
//     var products =
//         await FirebaseFirestore.instance.collection("leafyProducts").get();
//
//     mapPlantProducts(products);
//   }
//
//   mapPlantProducts(QuerySnapshot<Map<String, dynamic>> products) {
//     var list = products.docs
//         .map((item) => PlantsModel(
//               name: item["name"],
//               family: item["family"],
//               image: item["image"],
//               price: item["price"],
//               price1kg: item["price1kg"],
//               quantity: item["quantity"],
//             ))
//         .toList();
//     return list;
//   }
// }
