// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
//
// import '../../../../core/theme/app_decoration.dart';
// import '../../../../core/widgets/animation/animated_fade_slide.dart';
// import '../../../../core/widgets/custom_button.dart';
// import '../../../../core/widgets/custom_scafold.dart';
//
// import '../../../../core/widgets/textfields/otp_inout_fields.dart';
// import '../controller/auth_controller.dart';
//
// class VerifyOtpPage extends GetView<AuthController> {
//   const VerifyOtpPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return CustomScaffold(
//       showBackButton: true,
//
//       body: TweenFadeSlide(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Center(
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 margin: EdgeInsets.all(16),
//                 decoration: AppDecorations.cardDecoration(context),
//                 child: Form(
//                   key: controller.formKey,
//
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       /// Lottie Animation
//                       SizedBox(
//                         height: 150,
//
//                         child: Lottie.asset(
//                           "assets/lottie/otp_verify.json",
//
//                           repeat: true,
//
//                           fit: BoxFit.contain,
//
//                           errorBuilder: (context, error, stack) {
//                             return Image.asset("assets/images/logo.png");
//                           },
//                         ),
//                       ),
//
//                       const SizedBox(height: 10),
//
//                       Text(
//                         "Verify OTP",
//
//                         style: theme.textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//
//                       const SizedBox(height: 10),
//
//                       Text(
//                         "We've sent a 6 digit verification code\n"
//                         "to +91 ${controller.phoneController.text}",
//
//                         textAlign: TextAlign.center,
//
//                         style: theme.textTheme.bodyMedium?.copyWith(
//                           color: theme.colorScheme.onSurface.withOpacity(.6),
//                         ),
//                       ),
//
//                       const SizedBox(height: 10),
//
//                       /// Debug OTP only
//                       if (controller.sentOtp.value.isNotEmpty)
//                         Obx(
//                           () => AnimatedSwitcher(
//                             duration: const Duration(milliseconds: 300),
//
//                             child: Text(
//                               "OTP: ${controller.sentOtp.value}",
//
//                               key: ValueKey(controller.sentOtp.value),
//
//                               style: TextStyle(
//                                 color: theme.colorScheme.primary,
//
//                                 fontWeight: FontWeight.bold,
//
//                                 letterSpacing: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                       const SizedBox(height: 30),
//
//                       /// OTP Input
//                       OtpInputField(
//                         controller: controller.otpController,
//
//                         length: 6,
//
//                         onCompleted: (otp) {
//                           print("OTP : $otp");
//                         },
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       /// Verify Button
//                       Obx(
//                         () => SizedBox(
//                           width: double.infinity,
//
//                           child: CustomButton(
//                             title: controller.isLoading.value
//                                 ? "Verifying..."
//                                 : "Verify OTP",
//
//                             onTap: controller.isLoading.value
//                                 ? null
//                                 : () {
//                                     if (controller.formKey.currentState!
//                                         .validate()) {
//                                       controller.verifyOtp();
//                                     }
//                                   },
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 15),
//
//                       /// Resend
//                       Obx(
//                         () => TextButton(
//                           onPressed: controller.canResend.value
//                               ? controller.resendOtp
//                               : null,
//
//                           child: Text(
//                             controller.canResend.value
//                                 ? "Resend OTP"
//                                 : "Resend in ${controller.seconds.value}s",
//
//                             style: TextStyle(
//                               color: theme.colorScheme.primary,
//
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
