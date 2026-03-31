import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;

    String greeting = hour < 12
        ? "Morning"
        : hour < 17
        ? "Afternoon"
        : hour < 20
        ? "Evening"
        : "Night";

    final UserController c = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.5, vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.blue,
                child: Text("SC"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good $greeting!",
                    style: GoogleFonts.plusJakartaSans(fontSize: 12),
                  ),
                  Obx(
                    () => Text(
                      "${c.name}",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          badges.Badge(
            position: badges.BadgePosition.custom(end: 2, top: 4),
            badgeStyle: badges.BadgeStyle(badgeColor: Color(0xFFE25C5C)),
            child: IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                authService.value.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
