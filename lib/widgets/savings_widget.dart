import 'dart:math';

import 'package:fintech_app/widgets/saving_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final random = Random();

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Column(
        spacing: 10,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 10,
            children: [
              SavingCard(
                title: "iPhone 17 Pro Max",
                price: "\$999",
                progressColor: Colors.orange,
              ),
              SavingCard(
                title: "Airpods 3 Pro",
                price: "\$499",
                progressColor: Colors.black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 10,
            children: [
              SavingCard(
                title: "Playstation 5",
                price: "\$12,99",
                progressColor: Colors.blue,
              ),
              SavingCard(
                title: "ROG Laptop",
                price: "\$2,125",
                progressColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
