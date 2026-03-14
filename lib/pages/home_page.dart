import 'package:fintech_app/widgets/MyAppBar_widget.dart';
import 'package:fintech_app/widgets/balance_card_widget.dart';
import 'package:fintech_app/widgets/earnings_widget.dart';
import 'package:fintech_app/widgets/savings_widget.dart';
import 'package:fintech_app/widgets/spending_card_widget.dart';
import 'package:fintech_app/widgets/transactions_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
