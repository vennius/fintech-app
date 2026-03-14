import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningCard extends StatelessWidget {
  const EarningCard({
    super.key,
    required this.color,
    required this.title,
    required this.salary,
  });

  final Color color;
  final String title;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 130,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.75),
            child: Text(title[0]),
          ),
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(color: Colors.white),
              ),
              Text(
                salary,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
