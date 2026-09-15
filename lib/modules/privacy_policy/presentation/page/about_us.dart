import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_scafold.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'About Us',
      useAppBarGradient: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// WHO WE ARE
            _section(
              title: 'Who We Are',
              description:
              'Career & Skill Academy is a learning platform designed to help students learn subjects, practice concepts and develop useful skills through a simple and engaging digital learning experience.',
            ),

            /// OUR VISION
            _section(
              title: 'Our Vision',
              description:
              'Our vision is to make quality learning simple, accessible and engaging for every learner. We aim to create an environment where students can learn at their own pace, strengthen their knowledge and confidently prepare for their academic and career goals.',
            ),

            /// OUR MISSION
            _section(
              title: 'Our Mission',
              description:
              'Our mission is to support students throughout their learning journey by providing structured study content, practice opportunities, courses and smart learning tools that make education more effective and enjoyable.',
            ),

            /// WHAT WE OFFER
            Text(
              'What We Offer',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            _featureCard(
              icon: Icons.menu_book_rounded,
              title: 'Subject-Based Learning',
              subtitle:
              'Explore subjects such as Maths, English, Hindi, Science, Computer Science, Social Studies and Sanskrit in an organized learning environment.',
            ),

            _featureCard(
              icon: Icons.video_library_outlined,
              title: 'Online Courses',
              subtitle:
              'Learn through structured online courses and lessons designed to help you understand concepts and improve your knowledge.',
            ),

            _featureCard(
              icon: Icons.edit_note_rounded,
              title: 'Practice & Tests',
              subtitle:
              'Practice what you learn and test your understanding with learning activities and practice tests.',
            ),

            _featureCard(
              icon: Icons.smart_toy_outlined,
              title: 'AI Learning Assistance',
              subtitle:
              'Use smart AI-powered learning assistance to understand concepts, explore solutions and get additional support while studying.',
            ),

            const SizedBox(height: 16),

            /// WHY CHOOSE US
            Text(
              'Why Choose Career & Skill Academy?',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            _featureCard(
              icon: Icons.school_outlined,
              title: 'Student-Focused Learning',
              subtitle:
              'Our learning experience is designed around students and their everyday study needs.',
            ),

            _featureCard(
              icon: Icons.auto_stories_outlined,
              title: 'Learn at Your Own Pace',
              subtitle:
              'Continue your studies according to your own learning pace and revisit topics whenever required.',
            ),

            _featureCard(
              icon: Icons.track_changes_outlined,
              title: 'Track Your Progress',
              subtitle:
              'Keep track of your learning progress and continue working towards your study goals.',
            ),

            _featureCard(
              icon: Icons.psychology_outlined,
              title: 'Build Strong Concepts',
              subtitle:
              'Focus on understanding concepts, practicing regularly and developing stronger academic skills.',
            ),

            const SizedBox(height: 10),

            /// OUR COMMITMENT
            _section(
              title: 'Our Commitment',
              description:
              'We are committed to continuously improving the learning experience for students. We strive to provide useful educational content, simple learning tools and a supportive environment that encourages curiosity, consistency and skill development.',
            ),

            /// LEARNING MESSAGE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.cardGlowGradient,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primaryLight.withOpacity(.15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.lightbulb_outline_rounded,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keep Learning',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Learn every day, practice consistently and take one step closer to your goals.',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// FOOTER
            Center(
              child: Text(
                '© Career & Skill Academy. All rights reserved.',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.08),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 23,
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
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