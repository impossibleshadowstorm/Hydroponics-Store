// import 'dart:async';
//
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class AddressMapController extends GetxController {
//   final Completer<GoogleMapController> mapController = Completer();
//
//   CameraPosition kGooglePlex = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   List<Marker> markers = <Marker>[
//     const Marker(
//       markerId: MarkerId("1"),
//       position: LatLng(37.42796133580664, -122.085749655962),
//       infoWindow: InfoWindow(
//         title: "Your Location",
//       ),
//     ),
//   ];
//
//   void getUserCurrentLocation() async {
//     // await Geolocator.requestPermission()
//     //     .then((value) {})
//     //     .onError((error, stackTrace) {
//     //   print("error" + error.toString());
//     // });
//     // return await Geolocator.getCurrentPosition();
//
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     // if (permission == LocationPermission.deniedForever) {
//     //   // Permissions are denied forever, handle appropriately.
//     //   return Future.error(
//     //       'Location permissions are permanently denied, we cannot request permissions.');
//     // }
//
//     return await Geolocator.getCurrentPosition().then(
//       (value) async {
//         markers.clear();
//         markers.add(
//           Marker(
//             markerId: const MarkerId("2"),
//             position: LatLng(value.latitude, value.longitude),
//             infoWindow: const InfoWindow(title: "Your Current Location"),
//           ),
//         );
//
//         CameraPosition cameraPosition = CameraPosition(
//           target: LatLng(value.latitude, value.longitude),
//           zoom: 10,
//         );
//
//         final GoogleMapController controller = await mapController.future;
//
//         controller
//             .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       },
//     );
//     ;
//   }
// }
