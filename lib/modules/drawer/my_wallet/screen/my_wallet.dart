import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wallet_controller.dart';
import '../data/modal/wallet_model.dart';


class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wallet"),
      ),
      body: Obx(
            () => RefreshIndicator(
          onRefresh: () async {
            // TODO: controller.getWallet();
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _balanceCard(context),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      context,
                      icon: Icons.add,
                      title: "Add Money",
                      onTap: () {
                        Get.toNamed("/wallet/add-money");
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      context,
                      icon: Icons.history,
                      title: "Transactions",
                      onTap: () {
                        Get.toNamed("/wallet/transactions");
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/wallet/transactions");
                    },
                    child: const Text("View All"),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              if (controller.transactions.isEmpty)
                _emptyTransactions(context)
              else
                ...controller.transactions
                    .take(5)
                    .map(
                      (transaction) =>
                      _transactionCard(context, transaction),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _balanceCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Balance",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Obx(
                () => Text(
              "₹${controller.walletBalance.value.toStringAsFixed(2)}",
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Get.toNamed("/wallet/add-money");
              },
              child: const Text("Add Money"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionCard(
      BuildContext context,
      WalletTransactionModel transaction,
      ) {
    final theme = Theme.of(context);

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
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
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

  Widget _emptyTransactions(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 50,
            ),
            SizedBox(height: 12),
            Text("No Transactions"),
            SizedBox(height: 5),
            Text("Your transactions will appear here."),
          ],
        ),
      ),
    );
  }
}