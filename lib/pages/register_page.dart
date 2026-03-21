import 'package:fintech_app/pages/login_page.dart';
import 'package:fintech_app/widgets/auth/auth_field_widget.dart';
import 'package:fintech_app/widgets/auth/auth_login_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: GoogleFonts.plusJakartaSans(fontSize: 25, fontWeight: .bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          children: [
            AuthField(label: "Email", controller: controllerEmail),
            AuthField(
              label: "Password",
              controller: controllerPassword,
              isPassword: true,
            ),
            AuthButton(
              isLogin: false,
              isLoading: _isLoading,
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: controllerEmail.value.text,
                  password: controllerPassword.value.text,
                );
                setState(() {
                  _isLoading = false;
                });
              },
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 10,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.plusJakartaSans(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
