import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_store/Constants/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/confetti.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.8,
                    width: size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // image: DecorationImage(
                                  //   image: AssetImage("assets/image/payment.png"),
                                  // ),
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Google Pay Number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: ColorConstants.fadedWhiteColor,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "+91 8937936970",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          child: const Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bank Details"),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.account_balance,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Bank Transfer",
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            )
                                          ],
                                        ),
                                        Icon(Icons.check_circle,
                                            color: ColorConstants.primaryColor),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Bank Name",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Axis Bank",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Account Holder Name",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Rural Farms",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Account Number",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Rural Farms",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "IFSC Code",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "PUBNB0107400",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //left bubble
            Positioned(
              top: size.height * 0.5 - 15,
              left: size.width * 0.05 - 15,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
            // right bubble
            Positioned(
              top: size.height * 0.5 - 15,
              right: size.width * 0.05 - 15,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
            // center horizontal line
            Positioned(
              top: size.height * 0.5 - 2,
              right: size.width * 0.05 + 30,
              child: SizedBox(
                width: size.width * 0.8 - 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1 - 15,
              right: size.width * 0.05 + 30,
              child: SizedBox(
                width: size.width * 0.8 - 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
