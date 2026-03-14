import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class SavingCard extends StatelessWidget {
  const SavingCard({
    super.key,
    required this.title,
    required this.price,
    required this.progressColor,
  });

  final String title;
  final String price;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF707070),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                LinearPercentIndicator(
                  width: 120,
                  lineHeight: 7,
                  percent: 0.5,
                  barRadius: Radius.circular(7),
                  backgroundColor: Colors.grey,
                  progressColor: progressColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
