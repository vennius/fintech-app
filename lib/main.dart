import 'package:fintech_app/pages/home_page.dart';
import 'package:fintech_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FintechApp());
}

class FintechApp extends StatefulWidget {
  const FintechApp({super.key});

  @override
  State<FintechApp> createState() => _FintechAppState();
}

class _FintechAppState extends State<FintechApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('User is currently signed out!');
        setState(() {
          _isLoggedIn = false;
        });
      } else {
        // print('User is signed in!');
        setState(() {
          _isLoggedIn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_isLoggedIn ? LoginPage() : HomePage(),
    );
  }
}
