// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hydroponics_store/Constants/colors.dart';
// import 'package:hydroponics_store/Controllers/firebaseDataController.dart';
// import 'package:lottie/lottie.dart';
// import 'package:get/get.dart';
//
// class LandingScreen extends StatefulWidget {
//   const LandingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LandingScreen> createState() => _LandingScreenState();
// }
//
// class _LandingScreenState extends State<LandingScreen> {
//   // FirebaseDataController dataController = Get.find();
//   final categoryFilterList = [
//     {"name": "Leafy Products", "collectionName": "leafyProducts"},
//     {"name": "Vine Crop Products", "collectionName": "vineCropProducts"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.fadedWhiteColor,
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   height: AppBar().preferredSize.height + 20,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 50,
//                         width: 50,
//                         child: Lottie.asset("assets/images/green-leaf.json"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 80,
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     gradient: LinearGradient(
//                       colors: [
//                         ColorConstants.darkGreenColor,
//                         ColorConstants.lightGreenColor,
//                         ColorConstants.mediumGreenColor,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         width: 50,
//                         child: Lottie.asset("assets/images/woloo-leaf.json"),
//                       ),
//                       const SizedBox(width: 10),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.65 - 20,
//                         child: const Text(
//                           "Let's Get Some Plants and Veggies @ lowest price with 10% off.",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   color: Colors.red,
//                 ),
//                 const SizedBox(height: 20),
//                 // Most Popular Heading
//                 SizedBox(
//                   height: 40,
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const SizedBox(
//                             height: 30,
//                             width: 30,
//                             child: Image(
//                               image: AssetImage("assets/icons/more.png"),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             "Most Popular",
//                             style: TextStyle(
//                               color: ColorConstants.primaryColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 10),
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         overlayColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         onTap: () {},
//                         child: Text(
//                           "View All",
//                           style: TextStyle(
//                             color: ColorConstants.primaryColor.withOpacity(0.7),
//                             fontSize: 14.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 //  Most Popular List
//                 FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                   future:
//                       dataController.collectionQuerySnapshot("leafyProducts"),
//                   builder: (_, snapshot) {
//                     if (snapshot.hasData) {
//                       var list = snapshot.data?.docs.toList();
//                       return SizedBox(
//                         height: 240,
//                         width: double.infinity,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: list!.length > 9 ? 10 : list.length,
//                           itemBuilder: (_, index) {
//                             return productCard(list, index);
//                           },
//                         ),
//                       );
//                     }
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: ColorConstants.primaryColor,
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                       width: 20,
//                       child: Image(
//                         image:
//                             AssetImage("assets/icons/left-hamburger-menu.png"),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     SizedBox(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width - 80,
//                       child: Center(child: categoryFilter()),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Obx(() {
//                   return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                     future: dataController.collectionQuerySnapshot(
//                         categoryFilterList[dataController
//                             .categoryFilterNumber.value]["collectionName"]),
//                     builder: (_, snapshot) {
//                       if (snapshot.hasData) {
//                         var list = snapshot.data?.docs.toList();
//                         return Container(
//                           width: double.infinity,
//                           color: Colors.amberAccent,
//                           height: 240 * (list!.length/2).round().toDouble() + 11 * (list.length/2).round().toDouble(),
//                           child: categoryFilterProducts(list),
//                         );
//                         //   SizedBox(
//                         //   height: 240,
//                         //   width: double.infinity,
//                         //   // height: 220 * 30/2 + 20 * 30/2,
//                         //   child: ListView.builder(
//                         //     scrollDirection: Axis.horizontal,
//                         //     itemCount: list!.length > 9 ? 10 : list.length,
//                         //     itemBuilder: (_, index) {
//                         //       return productCard(list, index);
//                         //     },
//                         //   ),
//                         // );
//                       }
//                       return Center(
//                         child: CircularProgressIndicator(
//                           color: ColorConstants.primaryColor,
//                         ),
//                       );
//                     },
//                   );
//                 }),
//                 // Container(
//                 //   height: 500,
//                 //   width: double.infinity,
//                 //   color: Colors.blueAccent,
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Category Filter Products
//   Widget categoryFilterProducts(var list) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: list.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//         childAspectRatio: 0.75,
//       ),
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {},
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             width: 165,
//             decoration: const BoxDecoration(
//               color: Color(0xfff5f5da),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 130,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         list[index]["image"],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       list[index]["name"],
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15.0,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       "Min. qty.- ${list[index]["quantity"].toString()} gm",
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.0,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.currency_rupee_sharp,
//                           size: 12,
//                           color: ColorConstants.greyColor,
//                         ),
//                         const SizedBox(width: 3),
//                         Text(
//                           list[index]["price"].toStringAsFixed(2),
//                           style: const TextStyle(
//                             color: Color(0xffA6A67A),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Category Filter
//   Widget categoryFilter() {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       physics: const BouncingScrollPhysics(),
//       itemCount: categoryFilterList.length,
//       itemBuilder: (BuildContext context, index) {
//         return Obx(
//           () {
//             if (index == dataController.categoryFilterNumber.value) {
//               return InkWell(
//                 onTap: () {
//                   dataController.changeCategoryFilterName(index);
//                 },
//                 splashColor: Colors.transparent,
//                 overlayColor: MaterialStateProperty.all(Colors.transparent),
//                 child: Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Text(
//                     categoryFilterList[index]["name"].toString(),
//                     style: TextStyle(
//                       color: ColorConstants.primaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return InkWell(
//                 onTap: () {
//                   dataController.changeCategoryFilterName(index);
//                 },
//                 splashColor: Colors.transparent,
//                 overlayColor: MaterialStateProperty.all(Colors.transparent),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   alignment: Alignment.center,
//                   child: Text(
//                     categoryFilterList[index]["name"].toString(),
//                     style: TextStyle(color: ColorConstants.greyColor),
//                   ),
//                 ),
//               );
//             }
//           },
//         );
//       },
//     );
//   }
//
//   //Product Card
//   Widget productCard(var list, int index) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: const EdgeInsets.only(right: 20),
//         padding: const EdgeInsets.all(20.0),
//         width: 165,
//         decoration: const BoxDecoration(
//           color: Color(0xfff5f5da),
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 130,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     list[index]["image"],
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 Text(
//                   list[index]["name"],
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15.0,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   "Min. qty.- ${list[index]["quantity"].toString()} gm",
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 12.0,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.currency_rupee_sharp,
//                       size: 12,
//                       color: ColorConstants.greyColor,
//                     ),
//                     const SizedBox(width: 3),
//                     Text(
//                       list[index]["price"].toStringAsFixed(2),
//                       style: const TextStyle(
//                         color: Color(0xffA6A67A),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Widget tilesRow(var list) {
// //   return Container(
// //     margin: const EdgeInsets.only(bottom: 20),
// //     height: 220,
// //     width: double.infinity,
// //     child: Row(
// //       children: [
// //         Container(
// //           decoration: const BoxDecoration(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(20),
// //             ),
// //             color: Color(0xffF4F4D9),
// //           ),
// //           width: (MediaQuery
// //               .of(context)
// //               .size
// //               .width / 2) - 30,
// //         ),
// //         const SizedBox(width: 20),
// //         Container(
// //           width: (MediaQuery
// //               .of(context)
// //               .size
// //               .width / 2) - 30,
// //           decoration: const BoxDecoration(
// //             borderRadius: BorderRadius.all(
// //               Radius.circular(20),
// //             ),
// //             color: Color(0xffF4F4D9),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
//
// // GridView.builder(
// // // physics: NeverScrollableScrollPhysics(),
// // itemCount: 30,
// // scrollDirection: Axis.horizontal,
// // gridDelegate:
// // const SliverGridDelegateWithFixedCrossAxisCount(
// // crossAxisCount: 1,
// // mainAxisSpacing: 20.0,
// // crossAxisSpacing: 20.0,
// // childAspectRatio: 0.75,
// // ),
// // itemBuilder: (context, index) {
// // return Container(
// // height: 220,
// // width: 120,
// // color: Colors.red,
// // child: Text("hello$index"),
// // );
// // },
// // ),
