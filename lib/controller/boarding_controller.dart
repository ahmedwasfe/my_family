import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/model/splash.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';

class BoardingController extends GetxController{
  final PageController pageController = PageController();
  RxBool isLast = false.obs;
  List<SplashData> listBoarding = [];

  Future<void> getBoarding() async {
    await ApiRequestes.getSplash(language: AppHelper.getAppLanguage())
        .then((value)  {
          if(value != null){
            listBoarding.clear();
            listBoarding.addAll(value.result!.splash!);
          }
    });
  }

  void goToLogin({required bool isLogin}) {
    PreferencesManager.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) isLogin ? Get.offAndToNamed(Routes.login) : Get.offAndToNamed(Routes.createAccount)});
  }
}