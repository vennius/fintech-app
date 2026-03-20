import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef VoidCallback = void Function();

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.isLogin,
  });

  final VoidCallback onTap;
  final bool isLoading;
  final bool isLogin;

  @override
  Widget build(ontext) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(17.6)),
      child: Container(
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
          color: isLoading ? Colors.black54 : Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(17.6)),
        ),
        child: Center(
          child: isLoading
              ? Text(
                  "...",
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 16,
                  ),
                )
              : Text(
                  isLogin ? "Login" : "Sign Up",
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
