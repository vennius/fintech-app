import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
  });

  final String label;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 10,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 16)),
          ],
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hint: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFFD1D1D1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFFD1D1D1), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFFD1D1D1), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
