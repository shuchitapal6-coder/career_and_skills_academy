import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';




class WalletController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<Color?> colorAnimation;

  final walletBalance = 1250.75.obs;

  final transactions = [
    {
      'title': 'Wallet Recharge',
      'subtitle': 'Today, 10:30 AM',
      'amount': '+₹500',
      'type': 'debit',
      'image': 'assets/icons/wallet.png',
    },
    {
      'title': 'Survey Payment',
      'subtitle': 'Yesterday',
      'amount': '+₹1200',
      'type': 'debit',
      'image': 'assets/icons/wallet.png',
    },
    {
      'title': 'Bank Transfer',
      'subtitle': '20 May 2026 04:50',
      'amount': '-₹800',
      'type': 'debit',
      'image': 'assets/icons/wallet.png',
    },


    {
      "title": "Money Added",
      "subtitle": "Added via UPI",
      "amount": "+₹500",
      "type": "credit",
      'image': 'assets/icons/wallet.png',

    }
  ];
  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    colorAnimation = ColorTween(
      begin: AppColors.primary,
      end: AppColors.secondary,
    ).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}