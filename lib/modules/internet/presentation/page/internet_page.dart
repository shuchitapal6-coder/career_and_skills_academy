import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/configure/routs/app_routs.dart';
import '../controller.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({super.key});

  final InternetController controller = Get.put(InternetController());

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
                Icon(Icons.wifi_off, size: 90, color: Colors.red),

                const SizedBox(height: 20),

                const Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Please check your internet connection and try again.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () async {
                    bool connected = await Get.find<InternetController>()
                        .hasInternet();

                    if (connected) {
                      Get.offAllNamed(AppRoutes.splash);
                    }
                  },

                  child: const Text("Retry"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
