import 'package:get/get.dart';

import '../../../app/configure/routs/app_routs.dart';
import '../data/modal/profile_modal.dart';

class ProfileController extends GetxController {
  // final ProfileRepository repository;

  // ProfileController(this.repository);

  final isLoading = false.obs;

  final user = Rxn<ProfileModel>();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      isLoading.value = true;

      // final response = await repository.getProfile();

      // user.value = response;
    } catch (e) {
      // Show your CustomSnackBar here.
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    // Clear token/session from SharedPrefManager.

    Get.offAllNamed(AppRoutes.sendOtp);
  }
}
