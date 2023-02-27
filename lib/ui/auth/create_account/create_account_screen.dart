import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/create_account_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_text.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {

  final _controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: GetBuilder<CreateAccountController>(builder: (controller) => PageView.builder(
          controller: _controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _controller.listPages.length,
          itemBuilder: (context, index) => controller.listPages[index])),
    );
  }
}
