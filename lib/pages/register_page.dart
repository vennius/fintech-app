import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:fintech_app/widgets/auth/auth_field_widget.dart';
import 'package:fintech_app/widgets/auth/auth_login_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final TextEditingController controllerName = TextEditingController(
    text: "Ste venn",
  );
  final TextEditingController controllerEmail = TextEditingController(
    text: "stevenniuschandra@gmail.com",
  );
  final TextEditingController controllerPassword = TextEditingController(
    text: "Sc733148780",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: GoogleFonts.plusJakartaSans(fontSize: 25, fontWeight: .bold),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .center,
            spacing: 20,
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 110),
              AuthField(label: "Display Name", controller: controllerName),
              AuthField(label: "Email", controller: controllerEmail),
              AuthField(
                label: "Password",
                controller: controllerPassword,
                isPassword: true,
              ),
              AuthButton(
                isLogin: false,
                isLoading: _isLoading,
                onTap: onRegisterTap,
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
                      Get.back();
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
      ),
    );
  }

  void onRegisterTap() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final UserCredential user = await authService.value.firebaseAuth
          .createUserWithEmailAndPassword(
            email: controllerEmail.value.text,
            password: controllerPassword.value.text,
          );

      DocumentReference users = FirebaseFirestore.instance
          .collection("users")
          .doc(user.user?.uid);
      final userData = <String, dynamic>{
        'name': controllerName.value.text,
        'balance': 0,
      };

      users
          .set(userData)
          .then((value) => print("User added"))
          .catchError((error) => print("Failed"));

      Get.back();
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (err) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar("Registration Failed", err.message.toString());
      print("Register Error:");
      print(err.message);
      print("==========================");
    }
  }
}
