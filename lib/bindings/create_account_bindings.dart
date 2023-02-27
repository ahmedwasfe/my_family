
import 'package:get/get.dart';
import 'package:my_family/controller/create_account_controller.dart';

class CreateAccountBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
  }
}