import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        14,
        8,
        14,
        14,
      ),
      decoration: const BoxDecoration(
        gradient: AppColors.mainBgGradient,
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white.withOpacity(.18),
              border: Border.all(
                color: AppColors.white.withOpacity(.35),
              ),
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 34,
              color: AppColors.white,
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 1,
            height: 48,
            color: AppColors.white.withOpacity(.25),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'shuchita pal | ID: 43717',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'CLASS-VIII | CBSE',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white.withOpacity(.65),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}