import 'package:fintech_app/widgets/transaction_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                child: Text(
                  "See All",
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF489FCD),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Today",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: Color(0xFF707070),
            ),
          ),
          SizedBox(height: 12),
          Column(
            spacing: 12,
            children: [
              TransactionCard(
                title: "Gopay",
                description: "Topup E-Wallet",
                icon: Icons.wallet,
                spent: 32,
                color: Colors.blue,
              ),
              TransactionCard(
                title: "Paypal",
                description: "Topup Paypal Balance",
                icon: Icons.paypal,
                spent: 1000,
                color: Colors.deepPurpleAccent,
              ),
              TransactionCard(
                title: "Stockbit",
                description: "Deposit Stockbit",
                icon: Icons.currency_exchange,
                spent: 500,
                color: Colors.grey,
              ),
              TransactionCard(
                title: "Bitcoin",
                description: "Buy Bitcoin",
                icon: Icons.currency_bitcoin,
                spent: 15,
                color: const Color.fromARGB(255, 225, 206, 36),
              ),
              TransactionCard(
                title: "PS5",
                description: "Playstation 5 Console",
                icon: Icons.gamepad,
                spent: 1000,
                color: Colors.lightBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
