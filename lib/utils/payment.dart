import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fintech_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

ValueNotifier<PaymentUtils> paymentService = ValueNotifier(PaymentUtils());

class PaymentUtils {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserController c = Get.find();

  Future<void> payQR(String? fromUID, String? toUID, int value) async {
    try {
      if (c.balance.value < value) {
        toastification.show(
          title: Text("Payment Failed!"),
          autoCloseDuration: const Duration(seconds: 5),
          showProgressBar: true,
          type: .error,
          description: Text("Not enough balance..."),
        );
        return;
      }

      DocumentSnapshot toUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(toUID)
          .get();

      if (!toUser.exists) {
        toastification.show(
          title: Text("QR Error!"),
          autoCloseDuration: const Duration(seconds: 5),
          showProgressBar: true,
          type: .error,
          description: Text("User with this QR doesn't exist..."),
        );
        return;
      }

      await users.doc(fromUID).update({'balance': c.balance.value - value});

      await users.doc(toUID).update({'balance': toUser["balance"] + value});

      toastification.show(
        title: Text("Success"),
        autoCloseDuration: const Duration(seconds: 5),
        showProgressBar: true,
        type: .success,
        description: Text("Successfully paid \$$value"),
      );
      return;
    } catch (err) {
      print(err);
      toastification.show(
        title: Text("Unexpected Error!"),
        autoCloseDuration: const Duration(seconds: 5),
        showProgressBar: true,
        type: .error,
        description: Text("Something went wrong!"),
      );
    }
  }
}
