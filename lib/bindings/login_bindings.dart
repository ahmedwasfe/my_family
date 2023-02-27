
import 'package:get/get.dart';
import 'package:my_family/controller/login_controller.dart';

class LoginBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}