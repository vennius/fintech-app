import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.spent,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final num spent;

  @override
  Widget build(BuildContext context) {
    // final color iconColor = Colors.blue;
    return Container(
      width: double.infinity,
      // height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color.withAlpha(50),
                ),
                child: Icon(icon, color: color),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.plusJakartaSans(
                      color: Color(0xFF707070),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "-\$$spent",
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFFE25C5C),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
