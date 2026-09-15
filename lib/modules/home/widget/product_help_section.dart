import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../presentation/controller/home_controller.dart';

class ProductHelpSection extends GetView<HomeController> {
  const ProductHelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      const ProductHelpItem(
        title: 'How to login or\nregister on GradePlus',
        image:
        'https://images.unsplash.com/photo-1552664730-d307ca884978?w=800',
      ),
      const ProductHelpItem(
        title: 'Watch Videos on\nYoutube Channel',
        image:
        'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800',
      ),
      const ProductHelpItem(
        title: 'Refer a Friend &\nRs 100 Cash Reward',
        image:
        'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=800',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Product Help',
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
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final product = products[index];

              return _ProductHelpCard(
                product: product,
                onTap: () {
                  controller.openProductHelp(product.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductHelpItem {
  final String title;
  final String image;

  const ProductHelpItem({
    required this.title,
    required this.image,
  });
}

class _ProductHelpCard extends StatelessWidget {
  final ProductHelpItem product;
  final VoidCallback? onTap;

  const _ProductHelpCard({
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
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
              child: Image.network(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                    ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: AppColors.containerBg,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.help_outline_rounded,
                      size: 70,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.center,
              color: AppColors.iconSecondary.withOpacity(.82),
              child: Text(
                product.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}