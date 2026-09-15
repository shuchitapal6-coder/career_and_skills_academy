import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ExploreAiSection extends StatelessWidget {
  const ExploreAiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      const AiFeature(
        title: 'History',
        image: 'assets/images/ai/ai_history.png',
      ),
      const AiFeature(
        title: 'Detailed Solution',
        image: 'assets/images/ai/ai_solution.png',
      ),
      const AiFeature(
        title: 'Help me to Learn',
        image: 'assets/images/ai/ai_learning.png',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Explore AI Features',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: features.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return _AiFeatureCard(
                feature: features[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class AiFeature {
  final String title;
  final String image;

  const AiFeature({
    required this.title,
    required this.image,
  });
}

class _AiFeatureCard extends StatelessWidget {
  final AiFeature feature;

  const _AiFeatureCard({
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    feature.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: AppColors.containerBg,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.auto_awesome,
                          size: 60,
                          color: AppColors.primaryLight,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      size: 20,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            height: 42,
            alignment: Alignment.center,
            color: AppColors.iconSecondary.withOpacity(.8),
            child: Text(
              feature.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}