import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.bgColor});

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 271,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFF242424),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.only(top: 12, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 5,
                      children: [
                        Text(
                          "Total Balance",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFF242424),
                          ),
                        ),
                        Text(
                          "\$10,000.00",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: .w700,
                          ),
                        ),
                      ],
                    ),
                    Image.asset("assets/images/visa.png", width: 48),
                  ],
                ),
                SizedBox(height: 18),
                Text(
                  "1234 *** *** 3456",
                  style: GoogleFonts.inter(
                    color: Color(0xFF242424),
                    fontSize: 14,
                    wordSpacing: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Name',
                      style: GoogleFonts.inter(
                        color: Color(0xFFCFCFCF),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Stevennius Chandra',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .end,
                  children: [
                    Text(
                      'Exp',
                      style: GoogleFonts.inter(
                        color: Color(0xFFCFCFCF),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '09/23',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
