import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/configure/routs/app_routs.dart';
import '../../../../core/theme/controller/theme_controller.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../../../../core/widgets/profile/circle_profile.dart';

import '../controller/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return CustomScaffold(
      title: "Settings",

      body: Obx(
        () => TweenFadeSlide(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            children: [
              /// SETTINGS DATA
              if (controller.isLoading.value)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (controller.settings.value != null)
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleProfileWidget(
                        imageUrl: controller.settings.value?.logo,
                        radius: 40,
                        fallbackIcon: Icons.business,
                      ),
                      const SizedBox(height: 12),

                      Text(
                        controller.settings.value!.companyName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        controller.settings.value!.emailId,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 4),

                      Text(controller.settings.value!.phoneNo),

                      const SizedBox(height: 4),

                      Text(
                        controller.settings.value!.address,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),


              /// PREFERENCES
              _sectionTitle(context, "Preferences"),

              Obx(
                () => SwitchListTile(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme(value);
                  },
                  title: const Text("Dark Mode"),
                  secondary: const Icon(Icons.dark_mode),
                ),
              ),

              /// SUPPORT
              _sectionTitle(context, "Support"),

              _settingTile(
                icon: Icons.help_outline,
                title: "Help Center",
                onTap: () {
                  Get.toNamed(AppRoutes.helpSupport);
                },
              ),

              /// ABOUT
              _sectionTitle(context, "About"),

              _settingTile(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {
                  Get.toNamed(AppRoutes.cms, arguments: "privacy_policy");
                },
              ),

              _settingTile(
                icon: Icons.description_outlined,
                title: "Terms & Conditions",
                onTap: () {
                  Get.toNamed(AppRoutes.cms, arguments: "terms_conditions");
                },
              ),
              _settingTile(
                icon: Icons.person,
                title: "About Us",
                onTap: () {
                  Get.toNamed(AppRoutes.cms, arguments: "about_us");
                },
              ),          _settingTile(
                icon: Icons.call,
                title: "Contact Us",
                onTap: () {
                  Get.toNamed(AppRoutes.cms, arguments: "contact_us");
                },
              ),

              const SizedBox(height: 24), const SizedBox(height: 24),

              Divider(
                indent: 20,
                endIndent: 20,
                color: Theme.of(context).colorScheme.outline.withOpacity(.2),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Version 1.0.0",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      controller.settings.value?.copyright ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return TweenFadeSlide(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _socialItem({
    IconData? icon,
    String? imagePath,
    required String label,
    required String url,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        if (url.isNotEmpty) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imagePath != null
              ? Image.asset(imagePath, width: 26, height: 26)
              : Icon(icon, size: 26),

          const SizedBox(height: 6),

          Text(label, style: Get.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return TweenFadeSlide(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
