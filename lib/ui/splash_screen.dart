
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/splash_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context)  {
    AppHelper.statusBarColor(isHome: false);
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('${Const.images}app_logo.png',
            height: 150.h,
            width: 150.w,)),
          SizedBox(height: 20.h),
          AppText.medium(
              text: 'my_family',
              color: AppHelper.getAppTheme(),
              fontSize: 24.sp,
              fontWeight: FontWeight.w700),
          AppWidgets.CustomAnimationProgress(),
          // Image.asset('assets/images/logo.png',fit: BoxFit.contain,
          //           width: 200,)
        ],
      ),
    );
  }
}