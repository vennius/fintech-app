import 'package:fintech_app/widgets/more_wallet_widget.dart';
import 'package:fintech_app/widgets/transactions_widget.dart';
import 'package:fintech_app/widgets/wallet_appbar_widget.dart';
import 'package:fintech_app/widgets/wallet_card_widget.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              WalletAppbar(),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24),
                child: Row(
                  spacing: 16,
                  children: [
                    MoreWallet(),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: .horizontal,
                        child: Row(
                          spacing: 16,
                          crossAxisAlignment: .center,
                          children: [
                            WalletCard(bgColor: Colors.blue),
                            WalletCard(bgColor: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transactions(),
              // WalletSavings(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
