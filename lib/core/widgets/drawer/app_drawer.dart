
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final drawerController = Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            /// =========================
            /// PROFILE HEADER
            /// =========================
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  /// Decorative background
                  Positioned(
                    right: -30,
                    top: -30,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.onPrimary.withValues(
                          alpha: 0.08,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: -15,
                    bottom: -35,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.onPrimary.withValues(
                          alpha: 0.06,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// =========================
                        /// TOP ROW
                        /// =========================
                        Row(
                          children: [
                            /// Profile Image
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorScheme.onPrimary,
                              ),
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                colorScheme.primaryContainer,
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 32,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            /// Student Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Back',
                                    style: textTheme.labelMedium?.copyWith(
                                      color: colorScheme.onPrimary
                                          .withValues(alpha: 0.75),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'Student Name',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'student@email.com',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onPrimary
                                          .withValues(alpha: 0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Close Button
                            IconButton(
                              onPressed: Get.back,
                              tooltip: 'Close',
                              icon: Icon(
                                CupertinoIcons.xmark,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        /// =========================
                        /// STUDENT INFORMATION
                        /// =========================
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.onPrimary.withValues(
                              alpha: 0.10,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.12,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.person_crop_rectangle,
                                size: 18,
                                color: colorScheme.onPrimary,
                              ),

                              const SizedBox(width: 8),

                              Expanded(
                                child: Text(
                                  'Student ID: STU-001',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              /// Edit Profile
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  // Get.toNamed(AppRoutes.editProfile);
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                    CupertinoIcons.pencil,
                                    size: 18,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// =========================
            /// MENU
            /// =========================
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: drawerController.menuItems.length,
                itemBuilder: (context, index) {
                  final item = drawerController.menuItems[index];

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),

                    /// =========================
                    /// OPTIONAL IMAGE / ICON
                    /// =========================
                    leading: _buildLeadingIcon(
                      context,
                      item,
                    ),

                    /// =========================
                    /// TITLE
                    /// =========================
                    title: Text(
                      item.title.tr,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    /// =========================
                    /// TRAILING
                    /// =========================
                    trailing: _buildTrailing(
                      context,
                      item,
                    ),

                    /// =========================
                    /// TAP
                    /// =========================
                    onTap: item.isSwitch
                        ? null
                        : () {
                      Get.back();
                      item.onTap?.call();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// =========================================================
  /// LEADING ICON / IMAGE
  /// =========================================================
  Widget _buildLeadingIcon(
      BuildContext context,
      dynamic item,
      ) {
    final colorScheme = Theme.of(context).colorScheme;

    /// Image has priority
    if (item.image != null && item.image!.isNotEmpty) {
      return SizedBox(
        width: 28,
        height: 28,
        child: Image.asset(
          item.image!,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) {
            return Icon(
              item.icon ?? Icons.image_outlined,
              color: colorScheme.primary,
              size: 24,
            );
          },
        ),
      );
    }

    /// Fallback to icon
    if (item.icon != null) {
      return Icon(
        item.icon,
        color: colorScheme.primary,
        size: 24,
      );
    }

    /// Nothing available
    return const SizedBox(
      width: 28,
      height: 28,
    );
  }

  /// =========================================================
  /// TRAILING
  /// =========================================================
  Widget _buildTrailing(
      BuildContext context,
      dynamic item,
      ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    /// Dark Mode Switch
    if (item.isSwitch) {
      return Obx(
            () => Switch(
          value: drawerController.isDark.value,
          onChanged: drawerController.toggleTheme,
        ),
      );
    }

    /// Badge
    if (item.badge != null) {
      return CircleAvatar(
        radius: 12,
        backgroundColor: colorScheme.primary,
        child: Text(
          item.badge!,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    /// Arrow
    return Icon(
      Icons.arrow_forward_ios,
      size: 14,
      color: colorScheme.onSurfaceVariant,
    );
  }
}
