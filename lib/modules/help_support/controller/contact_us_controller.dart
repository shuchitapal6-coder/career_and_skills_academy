import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ContactUsController extends GetxController {
  //
  // final SupportDataSource dataSource;
  //
  // ContactUsController(this.dataSource);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();


  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  Future<void> submitContactForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      //
      // final request = SupportRequestModel(
      //   name: nameController.text.trim(),
      //   email: emailController.text.trim(),
      //   phone: phoneController.text.trim(),
      //   message: messageController.text.trim(),
      // );

      // final response = await dataSource.support(request);
      // print(response.message);
      // if (response.status == true) {
      //   Get.snackbar(
      //     "Success",
      //     response.message ?? "Support request submitted successfully",
      //   );

      //   clearForm();
      // } else {
      //   print(response.message);
      //   Get.snackbar("Error", response.message ?? "Something went wrong");
      // }
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  void clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
