// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hydroponics_store/Controllers/addressMapController.dart';
//
// class MapLocation extends StatefulWidget {
//   const MapLocation({Key? key}) : super(key: key);
//
//   @override
//   State<MapLocation> createState() => _MapLocationState();
// }
//
// class _MapLocationState extends State<MapLocation> {
//   AddressMapController addressMapController = Get.put(AddressMapController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: GoogleMap(
//                 onMapCreated: (GoogleMapController controller) {
//                   addressMapController.mapController.complete(controller);
//                 },
//                 myLocationButtonEnabled: false,
//                 initialCameraPosition: addressMapController.kGooglePlex,
//                 markers: Set<Marker>.of(addressMapController.markers),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.small(
//         onPressed: () async {
//           addressMapController.getUserCurrentLocation();
//           setState(() {});
//           // then(
//           //   (value) async {
//           //     print("${value.latitude}   ${value.longitude}");
//           //     addressMapController.markers.add(
//           //       Marker(
//           //         markerId: const MarkerId("2"),
//           //         position: LatLng(value.latitude, value.longitude),
//           //         infoWindow: const InfoWindow(title: "Your Current Location"),
//           //       ),
//           //     );
//           //
//           //     CameraPosition cameraPosition = CameraPosition(
//           //       target: LatLng(value.latitude, value.longitude),
//           //       zoom: 18,
//           //     );
//           //
//           //     final GoogleMapController controller =
//           //         await addressMapController.mapController.future;
//           //
//           //     controller.animateCamera(
//           //         CameraUpdate.newCameraPosition(cameraPosition));
//           //     setState(() {});
//           //   },
//           // );
//         },
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.my_location_sharp,
//           color: Colors.blueAccent,
//         ),
//       ),
//     );
//   }
// }
//
// // class MyApp extends StatefulWidget {
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   LatLng? destLocation = LatLng(40.7128, -74.0060);
// //   Location location = Location();
// //   loc.LocationData? _currentPosition;
// //   final Completer<GoogleMapController?> _controller = Completer();
// //   String? _address;
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     getCurrentLocation();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Flutter uber'),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.navigate_next),
// //         onPressed: () {},),
// //       body: Stack(
// //         children: [
// //           GoogleMap(
// //             zoomControlsEnabled: false,
// //             initialCameraPosition: CameraPosition(
// //               target: destLocation!,
// //               zoom: 16,
// //             ),
// //             onCameraMove: (CameraPosition? position) {
// //               if (destLocation != position!.target) {
// //                 setState(() {
// //                   destLocation = position.target;
// //                 });
// //               }
// //             },
// //             onCameraIdle: () {
// //               print('camera idle');
// //               getAddressFromLatLng();
// //             },
// //             onTap: (latLng) {
// //               print(latLng);
// //             },
// //             onMapCreated: (GoogleMapController controller) {
// //               _controller.complete(controller);
// //             },
// //           ),
// //           Align(
// //             alignment: Alignment.center,
// //             child: Padding(
// //               padding: const EdgeInsets.only(bottom: 35.0),
// //               child: Image.asset(
// //                 'images/pick.png',
// //                 height: 45,
// //                 width: 45,
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             top: 40,
// //             right: 20,
// //             left: 20,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.black),
// //                 color: Colors.white,
// //               ),
// //               padding: EdgeInsets.all(20),
// //               child: Text(_address ?? 'Pick your destination address',
// //                   overflow: TextOverflow.visible, softWrap: true),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   getAddressFromLatLng() async {
// //     try {
// //       GeoData data = await Geocoder2.getDataFromCoordinates(
// //           latitude: destLocation!.latitude,
// //           longitude: destLocation!.longitude,
// //           googleMapApiKey: "YOUR_API_KEY");
// //       setState(() {
// //         _address = data.address;
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }
// //
// //   getCurrentLocation() async {
// //     bool _serviceEnabled;
// //     PermissionStatus _permissionGranted;
// //
// //     _serviceEnabled = await location.serviceEnabled();
// //     final GoogleMapController? controller = await _controller.future;
// //
// //     if (!_serviceEnabled) {
// //       _serviceEnabled = await location.requestService();
// //       if (!_serviceEnabled) {
// //         return;
// //       }
// //     }
// //
// //     _permissionGranted = await location.hasPermission();
// //     if (_permissionGranted == PermissionStatus.denied) {
// //       _permissionGranted = await location.requestPermission();
// //       if (_permissionGranted != PermissionStatus.granted) {
// //         return;
// //       }
// //     }
// //     if (_permissionGranted == loc.PermissionStatus.granted) {
// //       location.changeSettings(accuracy: loc.LocationAccuracy.high);
// //
// //       _currentPosition = await location.getLocation();
// //       controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
// //         target:
// //         LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
// //         zoom: 16,
// //       )));
// //       setState(() {
// //         destLocation =
// //             LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
// //       });
// //     }
// //   }
// // }
