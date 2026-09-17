import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentFailedPage extends StatelessWidget {
  const PaymentFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel,
                  size: 90,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Payment Failed",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "We couldn't complete your payment.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Try Again"),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Get.offAllNamed("/wallet");
                  },
                  child: const Text("Back to Wallet"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}