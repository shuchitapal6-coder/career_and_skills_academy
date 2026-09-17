import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/modal/wallet_model.dart';



class WalletController extends GetxController {
  final isLoading = false.obs;
  final isAddingMoney = false.obs;

  final walletBalance = 2500.0.obs;

  final selectedFilter = "All".obs;

  final amountController = TextEditingController();

  final transactions = <WalletTransactionModel>[
    WalletTransactionModel(
      id: "TXN001",
      title: "Wallet Top Up",
      description: "Money added to wallet",
      amount: 1000,
      isCredit: true,
      status: "Success",
      date: DateTime(2026, 9, 17, 11, 30),
      paymentId: "pay_123456",
      paymentMethod: "UPI",
    ),
    WalletTransactionModel(
      id: "TXN002",
      title: "Course Payment",
      description: "Payment for course",
      amount: 500,
      isCredit: false,
      status: "Success",
      date: DateTime(2026, 9, 16, 16, 20),
      paymentId: "pay_123457",
      paymentMethod: "Wallet",
    ),
    WalletTransactionModel(
      id: "TXN003",
      title: "Wallet Top Up",
      description: "Money added to wallet",
      amount: 2000,
      isCredit: true,
      status: "Success",
      date: DateTime(2026, 9, 15, 14, 10),
      paymentId: "pay_123458",
      paymentMethod: "Card",
    ),
  ].obs;

  List<WalletTransactionModel> get filteredTransactions {
    if (selectedFilter.value == "All") {
      return transactions;
    }

    if (selectedFilter.value == "Credit") {
      return transactions.where((e) => e.isCredit).toList();
    }

    return transactions.where((e) => !e.isCredit).toList();
  }

  void selectFilter(String value) {
    selectedFilter.value = value;
  }

  void selectAmount(int amount) {
    amountController.text = amount.toString();
  }

  Future<void> addMoney() async {
    final amount = double.tryParse(amountController.text.trim());

    if (amount == null || amount <= 0) {
      Get.snackbar(
        "Invalid Amount",
        "Please enter a valid amount",
      );
      return;
    }

    if (amount < 100) {
      Get.snackbar(
        "Invalid Amount",
        "Minimum amount is ₹100",
      );
      return;
    }

    isAddingMoney.value = true;

    try {
      // TODO:
      // 1. Call create-order API
      // 2. Get Razorpay order_id
      // 3. Open Razorpay checkout
      //
      // Example:
      // createOrder(amount);

      await Future.delayed(const Duration(seconds: 1));

      // Demo only
      walletBalance.value += amount;

      transactions.insert(
        0,
        WalletTransactionModel(
          id: "TXN${DateTime.now().millisecondsSinceEpoch}",
          title: "Wallet Top Up",
          description: "Money added to wallet",
          amount: amount,
          isCredit: true,
          status: "Success",
          date: DateTime.now(),
          paymentId: "pay_demo",
          paymentMethod: "Razorpay",
        ),
      );

      amountController.clear();

      Get.back();

      Get.toNamed(
        "/wallet/payment-success",
        arguments: amount,
      );
    } catch (e) {
      Get.snackbar(
        "Payment Failed",
        e.toString(),
      );
    } finally {
      isAddingMoney.value = false;
    }
  }

  void paymentFailed() {
    Get.toNamed("/wallet/payment-failed");
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}