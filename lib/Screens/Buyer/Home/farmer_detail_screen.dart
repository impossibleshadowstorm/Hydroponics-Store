import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';
import 'package:hydroponics_store/Screens/Buyer/Home/buyer_plant_description.dart';

class FarmerDetailScreen extends StatefulWidget {
  const FarmerDetailScreen({Key? key}) : super(key: key);

  @override
  State<FarmerDetailScreen> createState() => _FarmerDetailScreenState();
}

class _FarmerDetailScreenState extends State<FarmerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7 - 20,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_sharp,
                                size: 20.0,
                              ),
                            ),
                            const Text(
                              "ABC ENTERPRISES",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bio Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width + 20,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/top.png"),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: -60,
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 80) * 0.4,
                          height: 130,
                          // padding: const EdgeInsets.all(20),

                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Center(
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6FAF5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              //Farmer logo

                              Center(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/framer.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width + 20,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                        child: Text(
                          "Star Enterprises",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "4.5",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "2,316 ratings",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "345",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "13",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 12.0,
                                backgroundColor: ColorConstants.primaryColor,
                                textStyle: TextStyle(
                                  color: ColorConstants.primaryColor,
                                ),
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: MediaQuery.of(context).size.width,
                  child: addedCropsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addedCropsList() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Get.to(() => const BuyerPlantDescription());
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage("assets/images/plant-three.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 15),
                            Text(
                              "Plant Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Quantity: 12 Kg",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Updated On: 25-12-2023",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Hydroponic plant",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
