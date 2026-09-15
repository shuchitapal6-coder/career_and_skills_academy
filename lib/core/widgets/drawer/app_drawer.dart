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

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                12,
                12,
                12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 55,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  /// Close Drawer Button
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    tooltip: 'Close',
                    icon: Icon(
                      CupertinoIcons.xmark,
                      color: theme.iconTheme.color,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            /// Menu
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                children: [
                  Column(
                    children: drawerController.menuItems.map((item) {
                      return ListTile(
                        leading: Icon(item.icon),

                        title: Text(
                          item.title.tr,
                        ),

                        trailing: item.isSwitch
                            ? Obx(
                              () => Switch(
                            value: drawerController.isDark.value,
                            onChanged:
                            drawerController.toggleTheme,
                          ),
                        )
                            : item.badge != null
                            ? CircleAvatar(
                          radius: 12,
                          child: Text(
                            item.badge!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                            : const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),

                        onTap: () {
                          Get.back();
                          item.onTap?.call();
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}