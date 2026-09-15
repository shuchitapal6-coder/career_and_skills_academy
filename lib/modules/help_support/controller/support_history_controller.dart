import 'package:get/get.dart';



class SupportHistoryController extends GetxController {
  // final SupportDataSource dataSource;
  //
  // SupportHistoryController(this.dataSource);

  RxBool isLoading = false.obs;

  // RxList<Datum> tickets = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSupport();
  }

  Future<void> getSupport() async {
    try {
      isLoading.value = true;

      // final DriverSupportlistModal result =
      // await dataSource.supportList();
      //
      // tickets.assignAll(result.data ?? []);
      // print(tickets.length);
      //
      //
      // print(result.message);
      // print(result.data);
    } catch (e) {
      print("Support histry ======================$e");
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}