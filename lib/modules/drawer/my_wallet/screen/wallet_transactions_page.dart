import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wallet_controller.dart';
import '../data/modal/wallet_model.dart';


class WalletTransactionsPage
    extends GetView<WalletController> {
  const WalletTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: Obx(
            () => Column(
          children: [
            const SizedBox(height: 12),

            _filters(),

            const SizedBox(height: 12),

            Expanded(
              child: controller.filteredTransactions.isEmpty
                  ? const Center(
                child: Text("No Transactions"),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount:
                controller.filteredTransactions.length,
                itemBuilder: (_, index) {
                  final transaction =
                  controller.filteredTransactions[index];

                  return _transactionItem(
                    context,
                    transaction,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filters() {
    return Obx(
          () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: ["All", "Credit", "Debit"].map(
                (filter) {
              final selected =
                  controller.selectedFilter.value == filter;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: selected,
                  onSelected: (_) {
                    controller.selectFilter(filter);
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget _transactionItem(
      BuildContext context,
      WalletTransactionModel transaction,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            transaction.isCredit
                ? Icons.arrow_downward
                : Icons.arrow_upward,
          ),
        ),
        title: Text(transaction.title),
        subtitle: Text(
          "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
        ),
        trailing: Text(
          "${transaction.isCredit ? '+' : '-'} ₹${transaction.amount.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Get.toNamed(
            "/wallet/transaction-details",
            arguments: transaction,
          );
        },
      ),
    );
  }
}