import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/modal/wallet_model.dart';


class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction =
    Get.arguments as WalletTransactionModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),

          const Icon(
            Icons.check_circle,
            size: 70,
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              "${transaction.isCredit ? '+' : '-'} ₹${transaction.amount.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              transaction.status,
            ),
          ),

          const SizedBox(height: 30),

          _detail(
            "Transaction ID",
            transaction.id,
          ),

          _detail(
            "Description",
            transaction.description,
          ),

          _detail(
            "Payment ID",
            transaction.paymentId ?? "-",
          ),

          _detail(
            "Payment Method",
            transaction.paymentMethod ?? "-",
          ),

          _detail(
            "Date",
            "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Generate/download receipt
              },
              icon: const Icon(Icons.download),
              label: const Text("Download Receipt"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}