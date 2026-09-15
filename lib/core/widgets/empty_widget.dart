import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';



class EmptyWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  final String? lottie;

  final IconData icon;

  final Widget? action;

  const EmptyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.lottie,
    this.icon = Icons.home_work_outlined,
    this.action,
  });

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );


    fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );


    scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );


    slideAnimation = Tween<Offset>(
      begin: const Offset(0, .2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );


    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,

            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 28),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// IMAGE / ICON
                  if(widget.lottie != null)

                    Lottie.asset(
                      widget.lottie!,
                      width: 220,
                      height: 220,
                      repeat: true,
                    )

                  else

                    TweenAnimationBuilder<double>(
                      tween: Tween(
                        begin: .9,
                        end: 1,
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,

                      builder: (context,value,child){

                        return Transform.scale(
                          scale: value,

                          child: Container(
                            height: 130,
                            width: 130,

                            decoration: BoxDecoration(
                              color: AppColors.primary
                                  .withOpacity(.08),
                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              widget.icon,
                              size:65,
                              color: AppColors.primary,
                            ),
                          ),
                        );

                      },
                    ),


                  const SizedBox(height:28),


                  Text(
                    widget.title,
                    textAlign: TextAlign.center,

                    style: AppTypography.heading2.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),


                  const SizedBox(height:12),


                  Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,

                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height:1.6,
                    ),
                  ),


                  if(widget.action != null)...[

                    const SizedBox(height:32),

                    widget.action!,
                  ]

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}