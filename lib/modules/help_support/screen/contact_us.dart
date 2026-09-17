import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_decoration.dart';
import '../../../core/widgets/animation/animated_fade_slide.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_scafold.dart';
import '../../../core/widgets/textfields/custom_textfields.dart';
import '../controller/contact_us_controller.dart';


class ContactUs extends GetView<ContactUsController> {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useAppBarGradient: true,
      title: "Contact Us",
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TweenFadeSlide(
          child: Column(
            children: [


              TweenFadeSlide(child: _contactForm(context)),
          
              const SizedBox(height: 16),
          
          
            ],
          ),
        ),
      ),
    );
  }



  Widget _contactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.cardDecoration(context).copyWith(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Submit Your Query",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Fill in the details below and our support team will contact you shortly.",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 20),

            CustomTextFiled(label: "Name",
              controller: controller.nameController,
              hint: "Full Name",

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your name";
                }

                if (value.trim().length < 3) {
                  return "Name must be at least 3 characters";
                }

                return null;
              },
            ),

            CustomTextFiled(
              label: "Email Address",
              controller: controller.emailController,
              hint: "Email Address",
              keyboardType: TextInputType.emailAddress,

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email is required";
                }

                if (!GetUtils.isEmail(value.trim())) {
                  return "Enter a valid email";
                }

                return null;
              },
            ),

            CustomTextFiled(
              label: "Phone Number",
              controller: controller.phoneController,
              hint: "Phone Number",
              maxlength: 10,
              keyboardType: TextInputType.phone,

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter phone number";
                }

                if (value.trim().length != 10) {
                  return "Phone number must be 10 digits";
                }

                return null;
              },
            ),


            CustomTextFiled(
              label: "Description",
              controller: controller.messageController,
              hint: "Describe your issue or requirement...",
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your message";
                }

                if (value.trim().length < 10) {
                  return "Message must be at least 10 characters";
                }

                return null;
              },
            ),


            Obx(
                  () => CustomButton(
                title: controller.isLoading.value
                    ? "Submitting..."
                    : "Submit Request",
                onTap: controller.isLoading.value
                    ? null
                    : controller.submitContactForm,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
