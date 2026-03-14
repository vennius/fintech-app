import 'dart:math';

import 'package:fintech_app/widgets/earning_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final random = Random();

class Earnings extends StatelessWidget {
  const Earnings({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> works = ["Upwork", "Freepik", "Fevr", "Instagram"];
    List<Color> colors = [
      Color(0xFFE0533D),
      Colors.blue,
      Colors.green,
      Colors.pinkAccent,
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Earnings",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: List.generate(works.length, (index) {
                return EarningCard(
                  color: colors.elementAt(index),
                  salary: "\$15,500",
                  title: works.elementAt(index),
                  key: Key("$index"),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
