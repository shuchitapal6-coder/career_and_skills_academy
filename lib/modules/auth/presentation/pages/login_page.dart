import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_scafold.dart';
import '../../../../core/widgets/textfields/custom_textfields.dart';

import '../../../../core/widgets/textfields/otp_inout_fields.dart';
import '../controller/auth_controller.dart';

class SendOtpPage extends GetView<AuthController> {
  SendOtpPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return CustomScaffold(
      backgroundImage: 'assets/images/bg_image.png',
      backgroundImageOpacity: 1.0,
      showAppBar: false,
      resizeToAvoidBottomInset: true,
      showBackButton: false,
      isLoading: controller.isLoading.value,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width > 600 ? 40 : 20,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// LOGO
                      Hero(
                        tag: 'app_logo',
                        child: Container(
                          // width: 120,
                          // height: 78,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: AppDecorations
                                .elevatedCard(context)
                                .boxShadow,
                          ),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),



                      /// LOGIN CARD
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 440,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              24,
                              28,
                              24,
                              24,
                            ),
                            decoration: AppDecorations.cardDecoration(
                              context,
                              radius: BorderRadius.circular(24),
                            ),
                            child: Form(
                              key: formKey,
                              child: Obx(
                                    () => Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    /// TITLE
                                    Center(
                                      child: Text(
                                        controller.isOtpSent.value
                                            ? 'Verify OTP'
                                            : 'Login to get started',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    /// SUBTITLE
                                    Center(
                                      child: Text(
                                        controller.isOtpSent.value
                                            ? 'Enter the OTP sent to your mobile number'
                                            : 'Enter your mobile number to continue',
                                        textAlign: TextAlign.center,
                                        style:
                                        theme.textTheme.bodyMedium,
                                      ),
                                    ),

                                    const SizedBox(height: 24),

                                    /// MOBILE NUMBER
                                    CustomTextFiled(
                                      label: 'Mobile Number',
                                      controller:
                                      controller.phoneController,
                                      hint: 'Enter mobile number',
                                      prefixText: '+91 ',
                                      maxlength: 10,
                                      prefixIcon:
                                      Icons.phone_android_rounded,
                                      keyboardType:
                                      TextInputType.phone,
                                      enabled:
                                      !controller.isOtpSent.value,
                                      validator: (value) {
                                        final input =
                                            value?.trim() ?? '';

                                        if (input.isEmpty) {
                                          return 'Please enter your mobile number';
                                        }

                                        if (!RegExp(r'^\d+$')
                                            .hasMatch(input)) {
                                          return 'Mobile number must contain only digits';
                                        }

                                        if (input.length != 10) {
                                          return 'Mobile number must be exactly 10 digits';
                                        }

                                        if (!RegExp(
                                          r'^[6-9]\d{9}$',
                                        ).hasMatch(input)) {
                                          return 'Please enter a valid Indian mobile number';
                                        }

                                        return null;
                                      },
                                    ),

                                    /// OTP SECTION
                                    if (controller.isOtpSent.value) ...[
                                      const SizedBox(height: 20),

                                      /// OTP FIELD
                                      CustomOtpField(
                                        controller: controller.otpController,
                                        length: 6,
                                        onCompleted: () {
                                          controller.verifyOtp();
                                        },
                                      ),

                                      const SizedBox(height: 22),

                                      /// VERIFY OTP
                                      CustomButton(
                                        title: 'Verify OTP',
                                        suffixIcon: const Icon(
                                          Icons.arrow_forward_rounded,
                                        ),
                                        onTap: () {
                                          // if (formKey.currentState!
                                          //     .validate()) {
                                            controller.verifyOtp();
                                          // }
                                        },
                                      ),

                                      const SizedBox(height: 14),

                                      /// RESEND OTP
                                      Center(
                                        child: Obx(
                                              () => controller.canResend.value
                                              ? TextButton(
                                            onPressed: controller
                                                .resendOtp,
                                            child: const Text(
                                              'Resend OTP',
                                            ),
                                          )
                                              : Text(
                                            'Resend OTP in '
                                                '${controller.seconds.value}s',
                                            style: theme.textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      /// CHANGE MOBILE NUMBER
                                      Center(
                                        child: TextButton(
                                          onPressed: controller
                                              .changeMobileNumber,
                                          child: const Text(
                                            'Change mobile number',
                                          ),
                                        ),
                                      ),
                                    ] else ...[
                                      /// CONTINUE BUTTON
                                      const SizedBox(height: 22),

                                      CustomButton(
                                        title: 'Continue',
                                        suffixIcon: const Icon(
                                          Icons.arrow_forward_rounded,
                                        ),
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            controller.sendOtp();
                                          }
                                        },
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// FOOTER
                      Text(
                        'Your journey starts here',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.white.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}