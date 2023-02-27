

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentController extends GetxController{
  late GlobalKey<FormState> formKey;
  late TextEditingController SearchController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    SearchController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    SearchController.dispose();

    super.dispose();
  }

}