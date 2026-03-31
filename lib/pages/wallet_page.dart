import 'package:fintech_app/controllers/user_controller.dart';
import 'package:fintech_app/widgets/floating_bar.dart';
import 'package:fintech_app/widgets/more_wallet_widget.dart';
import 'package:fintech_app/widgets/transactions_widget.dart';
import 'package:fintech_app/widgets/wallet_appbar_widget.dart';
import 'package:fintech_app/widgets/wallet_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    ScrollController controller = ScrollController();

    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  WalletAppbar(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 24,
                      left: 24,
                    ),
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
                                Obx(() => WalletCard(balance: c.balance.value)),
                                Obx(() => WalletCard(balance: c.balance.value)),
                                SizedBox(width: 8),
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
