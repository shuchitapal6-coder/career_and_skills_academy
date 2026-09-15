import 'package:get/get.dart';


import '../services/internet_services.dart';



class InternetController extends GetxController {

  final InternetService _service = InternetService();

  Future<bool> hasInternet() async {
    return await _service.checkConnection();
  }

}