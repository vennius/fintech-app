import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find();
    final formatCurrency = NumberFormat.simpleCurrency();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        // height: 138,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF242424),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Balance",
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Obx(
                () => Text(
                  formatCurrency.format(c.balance.value),
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5,
                children: [
                  IconButton(
                    onPressed: () {
                      // Get.defaultDialog(title: "Your QR", custom: Text("Test"));
                      Get.defaultDialog(
                        title: "QR Payment",
                        content: PrettyQrView.data(
                          data:
                              authService.value.currentUser?.uid ??
                              "unknown-user",
                          decoration: const PrettyQrDecoration(
                            quietZone: .standard,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.qr_code_2_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "My Wallet",
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton.filledTonal(
                        highlightColor: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // c.setCurrentRoute("/wallet");
                          Get.toNamed("/wallet");
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
