import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Controllers/Buyer/buyerMainController.dart';

import '../../../Constants/colors.dart';

class BuyerCartScreen extends StatefulWidget {
  const BuyerCartScreen({Key? key}) : super(key: key);

  @override
  State<BuyerCartScreen> createState() => _BuyerCartScreenState();
}

class _BuyerCartScreenState extends State<BuyerCartScreen> {
  BuyerMainController buyerMainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.fadedWhiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customAppBar('Cart'),
                Container(
                  height: (MediaQuery.of(context).size.height * 0.97) -
                      MediaQuery.of(context).padding.top -
                      AppBar().preferredSize.height,
                  color: Colors.yellow,
                  child: buyerMainController.cartProduct.isEmpty
                      ? const Center(
                          child: Text("No Items in your cart. Please Add some products.",),
                        )
                      : addedCropsList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget addedCropsList() {
    return ListView.builder(
      itemCount: buyerMainController.cartProduct.length,
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
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        buyerMainController.cartProduct[index].plant.cropImage),
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
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              buyerMainController
                                  .cartProduct[index].plant.cropName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              buyerMainController
                                  .cartProduct[index].plant.cropCategory,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${buyerMainController.cartProduct[index].qty} Kg.",
                              // buyerMainController.totalPrice.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
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
                          children: [
                            Text(
                              "Expiry: ${buyerMainController.cartProduct[index].plant.cropExpiryDate}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    buyerMainController.deleteFromCart(index);
                  },
                  child: SizedBox(
                    height: 120,
                    width: 30,
                    child: Icon(
                      Icons.delete_outline_sharp,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget customAppBar(appBarTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                appBarTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
