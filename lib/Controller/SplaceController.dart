import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Pages/Auth/LoginPage.dart';
import 'package:get/get.dart';

import '../Pages/GoogleMap/GoogleMap.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceHandle();
  }

  AuthController authController = Get.put(AuthController());
  Future<void> splaceHandle() async {
    await Future.delayed(const Duration(seconds: 10));
    if (authController.auth.currentUser != null) {
      Get.offAll(const GoogleMapPage());
    } else {
      Get.offAll(const LoginPage());
    }
  }
}
