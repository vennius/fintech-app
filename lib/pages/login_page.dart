import 'package:fintech_app/pages/register_page.dart';
import 'package:fintech_app/widgets/auth/auth_field_widget.dart';
import 'package:fintech_app/widgets/auth/auth_login_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController(
      text: "stevenniuschandra@gmail.com",
    );
    final TextEditingController _controllerPassword = TextEditingController(
      text: "Sc733148780",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
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
            AuthField(label: "Email", controller: _controllerEmail),
            AuthField(
              label: "Password",
              controller: _controllerPassword,
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                InkWell(
                  child: Text(
                    "forgot password?",
                    style: GoogleFonts.plusJakartaSans(fontSize: 14),
                  ),
                ),
              ],
            ),
            AuthButton(
              isLogin: true,
              isLoading: _isLoading,
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _controllerEmail.value.text,
                  password: _controllerPassword.value.text,
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
                  "Don't have an account?",
                  style: GoogleFonts.plusJakartaSans(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
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
