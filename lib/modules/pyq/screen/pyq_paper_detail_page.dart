import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_scafold.dart';
import '../controller/pyq_test_papers_controller.dart';

class PyqPaperDetailPage extends GetView<PyqTestPapersController> {
  const PyqPaperDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final images = controller.paper.questionImages;

    return CustomScaffold(
      showAppBar: true,
      showBackButton: true,
      useAppBarGradient: true,
      title: '',
      body: SafeArea(
        child: images.isEmpty
            ? Center(
          child: Text(
            'no_questions_found'.tr,
          ),
        )
            : PageView.builder(
          itemCount: images.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: Center(
                child: _buildImage(images[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImage(String image) {
    final isNetworkImage =
        image.startsWith('http://') ||
            image.startsWith('https://');

    if (isNetworkImage) {
      return Image.network(
        image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        loadingBuilder: (
            context,
            child,
            loadingProgress,
            ) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (
            context,
            error,
            stackTrace,
            ) {
          return const Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 50,
            ),
          );
        },
      );
    }

    return Image.asset(
      image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (
          context,
          error,
          stackTrace,
          ) {
        return const Center(
          child: Icon(
            Icons.broken_image_outlined,
            size: 50,
          ),
        );
      },
    );
  }
}