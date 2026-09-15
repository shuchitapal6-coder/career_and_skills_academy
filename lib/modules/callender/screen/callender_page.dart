import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

import '../../../core/theme/app_decoration.dart';
import '../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../core/widgets/empty_widget.dart';
import '../controller/callender_controller.dart';

import '../../../../core/widgets/custom_scafold.dart';

import '../data/modal/messagen modal.dart';

class CallenderPage extends GetView<CallenderController> {
  const CallenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: "Calender",
showBackButton: false,
      actions: [

      ],
      body: EmptyWidget(title: "Calender",subtitle: "Empty Calender",lottie: "assets/lotties/Empty State.json",)
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:   EdgeInsets.all(14),
      decoration: AppDecorations.cardDecoration(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Icon
          Container(
            width: 46,
            height: 56,

            child: const Icon(
              Icons.notifications_active,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 2),

                Text(
                  notification.message,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),

                const SizedBox(height: 3),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    notification.time,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
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
