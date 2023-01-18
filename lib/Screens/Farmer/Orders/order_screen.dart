import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.fadedWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar('Order To Deliver'),
              Container(
                height: (MediaQuery.of(context).size.height * 0.97) -
                    MediaQuery.of(context).padding.top -
                    AppBar().preferredSize.height,
                child: addedCropsList(),
              ),
            ],
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
          onTap: () {},
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
                              "Buyer Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "NH 250, Shop No. 25",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Dehradun, UK",
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
                              "Order Date: 25-12-2023",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            // Text(
                            //   "Hydroponic plant",
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w500,
                            //     fontSize: 12,
                            //   ),
                            // ),
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

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: AppBar().preferredSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appBarTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
