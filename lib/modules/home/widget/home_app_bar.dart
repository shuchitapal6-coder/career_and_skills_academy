import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';


class HomeAppBar extends GetView<HomeController>
    implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.mainBgGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 6,
                        ),
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: AppColors.white,
                          size: 22,
                        ),
                      );
                    },
                  ),

                  const SizedBox(width: 2),

                  Text(
                    'Home',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: controller.openWallet,
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),

                  IconButton(
                    onPressed: controller.openNotifications,
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 10,
                    ),
                    icon: const Icon(
                      CupertinoIcons.bell_solid,
                      color: AppColors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  2,
                  12,
                  8,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.20),
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.35),
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 27,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      width: 1,
                      height: 38,
                      color: AppColors.white.withOpacity(0.20),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'shuchita pal | ID: 43717',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'CLASS-VIII | CBSE',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.white.withOpacity(0.70),
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}