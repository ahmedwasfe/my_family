
import 'package:get/get.dart';
import 'package:my_family/controller/boarding_controller.dart';
import 'package:my_family/controller/home_controller.dart';
import 'package:my_family/controller/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BoardingController());
    Get.lazyPut(() => HomeController());
    // Get.put(SettingsController());
  }
}
