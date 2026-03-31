import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/pages/home_page.dart';
import 'package:fintech_app/pages/login_page.dart';
import 'package:fintech_app/pages/register_page.dart';
import 'package:fintech_app/pages/wallet_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

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
  @override
  Widget build(BuildContext context) {
    final UserController c = Get.put(UserController());

    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              c.setCurrentRoute("/home");
              return HomePage();
            }
            return LoginPage();
          },
        ),
        navigatorObservers: [
          GetObserver((routing) {
            c.setCurrentRoute(Get.currentRoute);
            print("Current Page: ");
            print(Get.currentRoute);
          }),
        ],
        initialRoute: "/home",
        getPages: [
          GetPage(name: "/home", page: () => HomePage()),
          GetPage(name: "/wallet", page: () => WalletPage()),
          GetPage(name: "/login", page: () => LoginPage()),
          GetPage(name: "/register", page: () => RegisterPage()),
        ],
      ),
    );
  }
}
