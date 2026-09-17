import 'package:career_and_skills_academy/core/widgets/custom_scafold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wallet_controller.dart';

class AddMoneyPage extends GetView<WalletController> {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text("Add Money"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Enter Amount",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: controller.amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "₹ ",
              hintText: "Enter amount",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Quick Amount",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [500, 1000, 2000, 5000].map(
                  (amount) {
                return OutlinedButton(
                  onPressed: () {
                    controller.selectAmount(amount);
                  },
                  child: Text("₹$amount"),
                );
              },
            ).toList(),
          ),

          const SizedBox(height: 30),

          Card(
            child: ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Razorpay"),
              subtitle: const Text(
                "UPI / Card / Net Banking",
              ),
              trailing: const Icon(Icons.check_circle),
            ),
          ),

          const SizedBox(height: 30),

          Obx(
                () => SizedBox(
              height: 52,
              width: double.infinity,
              child: FilledButton(
                onPressed: controller.isAddingMoney.value
                    ? null
                    : controller.addMoney,
                child: controller.isAddingMoney.value
                    ? const CircularProgressIndicator()
                    : const Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}