
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  late GlobalKey<FormState> formKey;
  late TextEditingController NameController;
  late TextEditingController EmailAddressController;
  late TextEditingController OtherParentController;



  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    NameController = TextEditingController();
    EmailAddressController = TextEditingController();
    OtherParentController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    NameController.dispose();
    EmailAddressController.dispose();
    OtherParentController.dispose();
    super.dispose();
  }

}