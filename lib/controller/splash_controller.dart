
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';



class SplashController extends GetxController {
  bool? boarding = PreferencesManager.getAppData(key: Const.KEY_BOARDING);

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    startApp();
    super.onInit();
  }

  Future startApp() {
    if (boarding != null) {
      if(AppHelper.getCurrentUserToken() != null){
        return Future.delayed(
            const Duration(seconds: 5), () => Get.offAndToNamed(Routes.home));
      }else{
        return Future.delayed(
            const Duration(seconds: 5), () => Get.offAndToNamed(Routes.login));
      }
    } else {
      return Future.delayed(
         const Duration(seconds: 5), () => Get.offAndToNamed(Routes.boarding));
    }
  }

}

class TestImage {

  static Future convert(GlobalKey context) async {
    if (context == null) return null;

    RenderRepaintBoundary? boundary = context.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary!.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngByte = byteData!.buffer.asUint8List();
    return pngByte;
  }
}
