import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:fintech_app/utils/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class FloatingBar extends StatelessWidget {
  const FloatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find();
    TextEditingController controller = TextEditingController();

    return Container(
      height: 65,
      width: double.infinity,
      margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () {
                Get.offAllNamed("/home");
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: BoxBorder.fromLTRB(
                    bottom: BorderSide(
                      color: c.currentRoute.value == "/home"
                          ? Colors.grey
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Icon(Icons.home_outlined, size: 30),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: "Scan to Pay",
                content: SizedBox(
                  width: 300,
                  height: 400,
                  child: MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: .noDuplicates,
                    ),
                    onDetect: (result) async {
                      Get.back();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Enter Amount to Pay"),
                            content: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Only numbers can be entered
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await paymentService.value.payQR(
                                    authService.value.currentUser?.uid,
                                    result.barcodes[0].rawValue,
                                    int.parse(controller.value.text),
                                  );
                                  controller.clear();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      // await paymentService.value.payQR(
                      //   authService.value.currentUser?.uid,
                      //   result.barcodes[0].rawValue,
                      //   500,
                      // );
                      // Get.snackbar("Payment", "Successfully paid \$1000");
                      return;
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF242424),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
            ),
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                Get.toNamed("/wallet");
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: BoxBorder.fromLTRB(
                    bottom: BorderSide(
                      color: c.currentRoute.value == "/wallet"
                          ? Colors.grey
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Icon(Icons.wallet_outlined, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
