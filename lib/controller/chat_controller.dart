import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{

  int tabIndex = 0;

  late GlobalKey<FormState> formKey;
  late TextEditingController GroupNameController;
  late TextEditingController DescriptionController;
  late TextEditingController SerachController;


  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    GroupNameController = TextEditingController();
    DescriptionController = TextEditingController();
    SerachController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    GroupNameController.dispose();
    DescriptionController.dispose();
    SerachController.dispose();
    super.dispose();
  }


}