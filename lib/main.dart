import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';
import 'package:hydroponics_store/Controllers/Farmer/farmerMainController.dart';
import 'package:hydroponics_store/Controllers/Transporter/transporterMainController.dart';
// import 'package:hydroponics_store/Controllers/firebaseDataController.dart';
import 'package:hydroponics_store/Screens/Starter/splash_screen.dart';
import 'Controllers/userModeController.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "hydroponic-store",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // FirebaseDataController dataController = Get.put(FirebaseDataController());
  UserModeController userModeController = Get.put(UserModeController());
  BuyerMainController buyerMainController = Get.put(BuyerMainController());
  FarmerMainController farmerMainController = Get.put(FarmerMainController());
  TransporterMainController transporterMainController = Get.put(TransporterMainController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hydroponics Store',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
