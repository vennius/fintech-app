import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WalletSavingCard extends StatelessWidget {
  const WalletSavingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.withAlpha(50),
            ),
            child: Icon(Icons.phone_android_rounded, color: Colors.blue),
          ),
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .start,
            spacing: 8,
            children: [
              Row(
                children: [
                  Text(
                    "iPhone 17 Pro",
                    style: GoogleFonts.inter(fontSize: 16, fontWeight: .w600),
                  ),
                  SizedBox(width: 60),
                  Text(
                    "\$699.00",
                    style: GoogleFonts.inter(fontSize: 16, fontWeight: .w600),
                  ),
                ],
              ),
              LinearPercentIndicator(
                width: 210,
                lineHeight: 7,
                percent: 0.5,
                barRadius: Radius.circular(7),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
