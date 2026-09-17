import 'package:flutter/material.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../../core/widgets/custom_scafold.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<Map<String, String>> _sections = [
    {
      'title': 'Your Privacy Matters',
      'body':
          'We at RealtyConnect respect your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use and protect your information while using our property services.',
    },
    {
      'title': 'Information We Collect',
      'body':
          'We may collect information such as your name, mobile number, email address, location details, property preferences, saved properties, enquiries and other information required to provide better real estate services.',
    },
    {
      'title': 'How We Use Your Information',
      'body':
          'Your information helps us provide property recommendations, connect buyers with dealers/owners, manage property listings, improve user experience and provide customer support.',
    },
    {
      'title': 'Property Listings & User Information',
      'body':
          'Users who list properties are responsible for providing accurate property details. RealtyConnect may display property information to help users discover and enquire about available properties.',
    },
    {
      'title': 'Location Information',
      'body':
          'We may use location services to provide relevant property searches based on your preferred city, locality or nearby properties. Location access can be managed from your device settings.',
    },
    {
      'title': 'Third Party Services',
      'body':
          'RealtyConnect may use trusted third-party services for analytics, notifications, payments or communication. These services may have their own privacy policies.',
    },
    {
      'title': 'Data Security',
      'body':
          'We implement appropriate security measures to protect your personal information. However, no online platform can guarantee complete security of data.',
    },
    {
      'title': 'Your Rights',
      'body':
          'You can update your profile information, manage your preferences and request assistance regarding your personal data by contacting our support team.',
    },
    {
      'title': 'Contact Us',
      'body':
          'If you have any questions regarding this Privacy Policy, please contact RealtyConnect support team.',
    },
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return CustomScaffold(
      title: 'Privacy Policy',
      useAppBarGradient: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            ...List.generate(_sections.length, (index) {
              final section = _sections[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _buildAnimatedSection(
                  context,
                  index: index,
                  title: section['title']!,
                  body: section['body']!,
                ),
              );
            }),

            const SizedBox(height: 8),

            TweenFadeSlide(
              beginOffset: const Offset(0, 0.08),
              child: _buildFooter(context),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INTRO
  // ============================================================

  Widget _buildIntroCard(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: AppDecorations.primaryCard(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colors.onPrimary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.privacy_tip_outlined, color: colors.onPrimary),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Privacy',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'We value your trust and are committed to protecting your personal information.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onPrimary.withValues(alpha: 0.78),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ANIMATED SECTION
  // ============================================================

  Widget _buildAnimatedSection(
    BuildContext context, {
    required int index,
    required String title,
    required String body,
  }) {
    final start = (index * 0.09).clamp(0.0, 0.75);
    final end = (start + 0.35).clamp(0.0, 1.0);

    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.12),
          end: Offset.zero,
        ).animate(animation),
        child: _buildPolicyCard(
          context,
          index: index,
          title: title,
          body: body,
        ),
      ),
    );
  }

  // ============================================================
  // POLICY CARD
  // ============================================================

  Widget _buildPolicyCard(
    BuildContext context, {
    required int index,
    required String title,
    required String body,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                body,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.68),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline_rounded, size: 18, color: colors.primary),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Please review this policy periodically.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
