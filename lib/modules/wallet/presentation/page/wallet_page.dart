
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../../../../core/widgets/listtile/listtile.dart';
import '../controller/wallet_controlller.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoBack = Navigator.of(context).canPop();
    return CustomScaffold(
      title: "Wallet",
      showBackButton: canGoBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: TweenFadeSlide(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),

                    child: Image.asset("assets/icons/wallet.png"),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                        top: 20,bottom: 12
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Transactions",
                            style: context.textTheme.titleMedium,
                          ),

                          Text(
                            "View All",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    TweenFadeSlide(

                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics:NeverScrollableScrollPhysics(),
                        itemCount: controller.transactions.length,
                        itemBuilder: (context, index) {
                          final item = controller.transactions[index];

                          final bool isCredit = item['amount']!.startsWith(
                            '+',
                          );

                          return TweenFadeSlide(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                              child: AppListTile(
                                leading: Image.asset(
                                  item['image']!,
                                  width: 28,
                                  height: 28,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : null,
                                ),
                                title: item['title']!,
                                subtitle: item['subtitle']!,
                                trailing: Text(
                                  item['amount']!,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    color: isCredit
                                        ? AppColors.success
                                        : Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                        top: 20,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Methods",
                            style: context.textTheme.titleMedium,
                          ),

                          Text(
                            "",
                            style: context.textTheme.titleMedium?.copyWith(
                              color: AppColors.info,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    TweenFadeSlide(

                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: AppDecorations.cardDecoration(context),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/upi.png",
                              width: 36,
                              height: 36,
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "UPI",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "raj******@upi",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(),
                                  ),
                                ],
                              ),
                            ),

                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
