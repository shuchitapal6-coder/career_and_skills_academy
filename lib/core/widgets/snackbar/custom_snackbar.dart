import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';

enum SnackType { success, error, info }

class CustomSnackBar {
  static void show(
    String message, {
    SnackType type = SnackType.info,
    String? title,
  }) {
    final isDark = Get.isDarkMode;

    Color bgColor;
    String finalTitle;

    switch (type) {
      case SnackType.success:
        bgColor = AppColors.secondary;
        finalTitle = title ?? "Success";
        break;

      case SnackType.error:
        bgColor = AppColors.error;
        finalTitle = title ?? "Error";
        break;

      case SnackType.info:
      bgColor = const Color(0xFF6C63FF);
        finalTitle = title ?? "Info";
    }

    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 400),

        messageText: _AnimatedSnackContent(
          title: finalTitle,
          message: message,
          bgColor: bgColor,
          type: type,
          isDark: isDark,
        ),
      ),
    );
  }
}

class _AnimatedSnackContent extends StatefulWidget {
  final String title;
  final String message;
  final Color bgColor;
  final SnackType type;
  final bool isDark;

  const _AnimatedSnackContent({
    required this.title,
    required this.message,
    required this.bgColor,
    required this.type,
    required this.isDark,
  });

  @override
  State<_AnimatedSnackContent> createState() => _AnimatedSnackContentState();
}

class _AnimatedSnackContentState extends State<_AnimatedSnackContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progress;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _progress = Tween<double>(begin: 1, end: 0).animate(_controller);

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  /// 🔥 Lottie Mapping
  String _getLottieAsset() {
    switch (widget.type) {
      case SnackType.success:
        return 'assets/lotties/success.json';
      case SnackType.error:
        return 'assets/lotties/error.json';
      case SnackType.info:
      return 'assets/lotties/info.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Container(
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.bgColor.withOpacity(0.25),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: widget.isDark ? Colors.black54 : Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// 🔥 Progress Bar
              AnimatedBuilder(
                animation: _progress,
                builder: (_, __) {
                  return LinearProgressIndicator(
                    value: _progress.value,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  );
                },
              ),

              /// 🎯 CONTENT
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    /// 🔥 LOTTIE ANIMATION
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Lottie.asset(_getLottieAsset(), repeat: false),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
