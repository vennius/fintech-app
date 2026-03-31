import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:fintech_app/widgets/MyAppBar_widget.dart';
import 'package:fintech_app/widgets/balance_card_widget.dart';
import 'package:fintech_app/widgets/earnings_widget.dart';
import 'package:fintech_app/widgets/floating_bar.dart';
import 'package:fintech_app/widgets/savings_widget.dart';
import 'package:fintech_app/widgets/spending_card_widget.dart';
import 'package:fintech_app/widgets/transactions_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final UserController c = Get.find();
    c.setCurrentRoute("/home");
    FirebaseFirestore.instance
        .collection('users')
        .doc(authService.value.currentUser?.uid)
        .get()
        .then((DocumentSnapshot document) {
          c.setBalance(document["balance"]);
          c.setName(document["name"]);
        });
    Stream userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(authService.value.currentUser?.uid)
        .snapshots();
    userStream.listen((snapshot) {
      c.setBalance(snapshot["balance"]);
      c.setName(snapshot["name"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserController c = Get.put(UserController());

    c.setCurrentRoute("/home");

    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  MyAppBar(),
                  BalanceCard(),
                  SpendingCard(),
                  Earnings(),
                  Savings(),
                  SizedBox(height: 15),
                  Transactions(),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ScrollToHide(
                hideDirection: Axis.vertical,
                scrollController: controller,
                height: 80,
                duration: Duration(milliseconds: 300),
                child: FloatingBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
