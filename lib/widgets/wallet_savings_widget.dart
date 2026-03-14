import 'package:fintech_app/widgets/wallet_saving_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletSavings extends StatelessWidget {
  const WalletSavings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Column(
        spacing: 16,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Savings",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                child: Text(
                  "See All",
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF489FCD),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          WalletSavingCard(),
        ],
      ),
    );
  }
}
