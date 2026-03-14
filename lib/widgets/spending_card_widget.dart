import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF242424),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_downward, color: Color(0xFF53D258), size: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: GoogleFonts.plusJakartaSans(color: Colors.white),
                    ),
                    Text(
                      "\$20,000",
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            VerticalDivider(color: Colors.white, width: 2),
            Row(
              children: [
                Icon(Icons.arrow_upward, color: Color(0xFFE25C5C), size: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Outcome",
                      style: GoogleFonts.plusJakartaSans(color: Colors.white),
                    ),
                    Text(
                      "\$17,000",
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
