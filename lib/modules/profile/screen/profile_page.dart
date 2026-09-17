import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';

import '../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../core/widgets/appbar/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_scafold.dart';
import '../controller/profile_controller.dart';


import '../../../core/theme/app_decoration.dart';
import '../../../core/theme/app_radius.dart';


class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return CustomScaffold(
 useAppBarGradient: true,
title: "Profile",
      body: Obx(
            () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.getProfile,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: const EdgeInsets.fromLTRB(
                16,
                16,
                16,
                32,
              ),
              children: [
                TweenFadeSlide(
                  beginOffset: const Offset(0, -0.08),
                  child: _buildProfileHeader(
                    context,
                    theme,
                    colors,
                  ),
                ),

                const SizedBox(height: 20),

                TweenFadeSlide(
                  child: _buildLearningOverview(context),
                ),

                const SizedBox(height: 20),

                TweenFadeSlide(
                  child: _buildAcademicSection(context),
                ),

                const SizedBox(height: 16),

                TweenFadeSlide(
                  child: _buildActivitySection(context),
                ),

                const SizedBox(height: 16),

                TweenFadeSlide(
                  child: _buildAccountSection(context),
                ),

                const SizedBox(height: 16),

                TweenFadeSlide(
                  child: _buildSettingsSection(context),
                ),

                const SizedBox(height: 20),

                TweenFadeSlide(
                  beginOffset: const Offset(0, 0.12),
                  child: _buildLogoutButton(
                    context,
                    colors,
                  ),
                ),

                const SizedBox(height: 12),

                Center(
                  child: Text(
                    'App Version 1.0.0',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withValues(
                        alpha: 0.45,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(
      BuildContext context,
      ThemeData theme,
      ColorScheme colors,
      ) {
    final user = controller.user.value;

    final name = user?.name?.trim();
    final email = user?.email?.trim();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: AppDecorations.primaryCard(context),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.onPrimary.withValues(alpha: 0.14),
                  border: Border.all(
                    color: colors.onPrimary.withValues(alpha: 0.35),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 44,
                  color: colors.onPrimary,
                ),
              ),

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.onPrimary,
                  border: Border.all(
                    color: colors.primary,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                  color: colors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            name?.isNotEmpty == true ? name! : 'Student',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colors.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),

          if (email?.isNotEmpty == true) ...[
            const SizedBox(height: 5),
            Text(
              email!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onPrimary.withValues(alpha: 0.75),
              ),
            ),
          ],

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: colors.onPrimary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.badge_outlined,
                  size: 15,
                  color: colors.onPrimary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Student',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.toNamed(AppRoutes.Editprofile);
              },
              icon: Icon(
                Icons.edit_outlined,
                size: 18,
                color: colors.onPrimary,
              ),
              label: Text(
                'Edit Profile',
                style: TextStyle(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  46,
                ),
                side: BorderSide(
                  color: colors.onPrimary.withValues(alpha: 0.4),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.border12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLearningOverview(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Learning Overview',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppDecorations.cardDecoration(context),
          child: Row(
            children: [
              _buildStatItem(
                context,
                icon: Icons.menu_book_outlined,
                value: '12',
                label: 'Courses',
              ),

              _buildStatDivider(context),

              _buildStatItem(
                context,
                icon: Icons.check_circle_outline,
                value: '08',
                label: 'Completed',
              ),

              _buildStatDivider(context),

              _buildStatItem(
                context,
                icon: Icons.workspace_premium_outlined,
                value: '04',
                label: 'Certificates',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(
      BuildContext context, {
        required IconData icon,
        required String value,
        required String label,
      }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            size: 21,
            color: colors.primary,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 1,
      height: 45,
      color: colors.outline.withValues(alpha: 0.15),
    );
  }
  Widget _buildAccountSection(
      BuildContext context,
      ) {
    return _buildSection(
      context,
      title: 'Account',
      children: [
        _buildMenuTile(
          context,
          icon: Icons.person_outline_rounded,
          title: 'Personal Information',
          subtitle: 'Update your personal details',
          onTap: () {
            Get.toNamed(
              AppRoutes.Editprofile,
            );
          },
        ),
        _buildDivider(context),
        const SizedBox(height: 16),

        TweenFadeSlide(
          child: _buildAcademicSection(context),
        ),
        _buildDivider(context),
        _buildMenuTile(
          context,
          icon: Icons.lock_outline_rounded,
          title: 'Change Password',
          subtitle: 'Update your account password',
          onTap: () {},
        ),
      ],
    );
  }
  Widget _buildAcademicSection(BuildContext context) {
    return _buildSection(
      context,
      title: 'Academic Information',
      children: [
        _buildMenuTile(
          context,
          icon: Icons.school_outlined,
          title: 'Education',
          subtitle: 'B.Tech Computer Science',
          onTap: () {
            Get.toNamed(AppRoutes.Editprofile);
          },
        ),

        _buildDivider(context),

        _buildMenuTile(
          context,
          icon: Icons.account_balance_outlined,
          title: 'Institution',
          subtitle: 'Your college or university',
          onTap: () {
            Get.toNamed(AppRoutes.Editprofile);
          },
        ),

        _buildDivider(context),

        _buildMenuTile(
          context,
          icon: Icons.calendar_today_outlined,
          title: 'Graduation Year',
          subtitle: '2027',
          onTap: () {
            Get.toNamed(AppRoutes.Editprofile);
          },
        ),
      ],
    );
  }
  Widget _buildActivitySection(
      BuildContext context,
      ) {
    return _buildSection(
      context,
      title: 'Learning',
      children: [
        _buildMenuTile(
          context,
          icon: Icons.menu_book_outlined,
          title: 'My Courses',
          subtitle: 'Continue your enrolled courses',
          onTap: () {
            // Get.toNamed(AppRoutes.myCourses);
          },
        ),

        _buildDivider(context),

        _buildMenuTile(
          context,
          icon: Icons.bookmark_border_rounded,
          title: 'Saved Courses',
          subtitle: 'Courses saved for later',
          onTap: () {
            // Get.toNamed(AppRoutes.savedCourses);
          },
        ),

        _buildDivider(context),

        _buildMenuTile(
          context,
          icon: Icons.workspace_premium_outlined,
          title: 'Certificates',
          subtitle: 'View your earned certificates',
          onTap: () {
            // Get.toNamed(AppRoutes.certificates);
          },
        ),

        _buildDivider(context),

        _buildMenuTile(
          context,
          icon: Icons.history_rounded,
          title: 'Learning History',
          subtitle: 'View your recent learning activity',
          onTap: () {},
        ),
      ],
    );
  }
  Widget _buildSettingsSection(
      BuildContext context,
      ) {
    return _buildSection(
      context,
      title: 'Preferences',
      children: [
        _buildMenuTile(
          context,
          icon: Icons.notifications_none_rounded,
          title: 'Notifications',
          subtitle: 'Manage notification preferences',
          onTap: () {},
        ),
        _buildDivider(context),
        _buildMenuTile(
          context,
          icon: Icons.language_rounded,
          title: 'Language',
          subtitle: 'Choose your preferred language',
          onTap: () {},
        ),
        _buildDivider(context),
        _buildAppearanceTile(context),
      ],
    );
  }

  Widget _buildSection(
      BuildContext context, {
        required String title,
        required List<Widget> children,
      }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      decoration: AppDecorations.cardDecoration(
        context,
      ),
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          ...children,
        ],
      ),
    );
  }

  Widget _buildMenuTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
        Widget? trailing,
      }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 1.0,
        end: 1.0,
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
      builder: (
          context,
          scale,
          child,
          ) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.border12,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(
                        alpha: 0.09,
                      ),
                      borderRadius: AppRadius.border12,
                    ),
                    child: Icon(
                      icon,
                      size: 21,
                      color: colors.primary,
                    ),
                  ),

                  const SizedBox(width: 13),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(
                            color: colors.onSurface
                                .withValues(alpha: 0.58),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  trailing ??
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 22,
                        color: colors.onSurface
                            .withValues(alpha: 0.40),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppearanceTile(
      BuildContext context,
      ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final isDark =
        theme.brightness == Brightness.dark;

    return _buildMenuTile(
      context,
      icon: isDark
          ? Icons.dark_mode_rounded
          : Icons.light_mode_rounded,
      title: 'Appearance',
      subtitle: isDark
          ? 'Dark mode is enabled'
          : 'Light mode is enabled',
      trailing: Switch.adaptive(
        value: isDark,
        onChanged: (value) {
          Get.changeThemeMode(
            value
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
      onTap: () {
        Get.changeThemeMode(
          isDark
              ? ThemeMode.light
              : ThemeMode.dark,
        );
      },
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.7,
      color: Theme.of(context)
          .dividerColor
          .withValues(alpha: 0.45),
    );
  }

  Widget _buildLogoutButton(
      BuildContext context,
      ColorScheme colors,
      ) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Logout',
        onTap: () {
          _showLogoutDialog(context);
        },
        backgroundColor: colors.error,
      ),
    );
  }

  void _showLogoutDialog(
      BuildContext context,
      ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text(
          'Are you sure you want to logout?',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.border20,
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Get.back();
              controller.logout();
            },
            style: FilledButton.styleFrom(
              backgroundColor: colors.error,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}


