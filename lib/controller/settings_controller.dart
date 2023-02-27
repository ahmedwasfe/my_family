import 'dart:io';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/controller/home_controller.dart';
import 'package:my_family/model/language.dart';
import 'package:my_family/model/theme.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';

import '../utils/app_text.dart';

class SettingsController extends GetxController{

  String themeSelected = '';
  String languageSelected = '';
  late GlobalKey<FormState> formKey;


  late TextEditingController  ProblemController;
  late TextEditingController ExplanationproblemController;


  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    ProblemController = TextEditingController();
    ExplanationproblemController = TextEditingController();

    super.onInit();

  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    ProblemController.dispose();
    ExplanationproblemController.dispose();

    super.dispose();
  }


  String getUserName() {
    if(AppHelper.getUserType() == Const.KEY_FAMILY){
      if(AppHelper.getCurrentParentUser()!.parentName != null){
        return AppHelper.getCurrentParentUser()!.parentName!;
      }else {
        return AppHelper.getCurrentParentUser()!.otherParentName!;
      }
    }else {
      if(AppHelper.getCurrentOtherUser()!.name != null){
        return AppHelper.getCurrentOtherUser()!.name!;
      }else {
        return AppHelper.getCurrentOtherUser()!.family!.familyName!;
      }
    }
  }

  String getUserEmail() {
    if(AppHelper.getUserType() == Const.KEY_FAMILY){
      if(AppHelper.getCurrentParentUser()!.parentEmail != null){
        return AppHelper.getCurrentParentUser()!.parentEmail!;
      }else {
        return AppHelper.getCurrentParentUser()!.otherParentEmail!;
      }
    }else {
      if(AppHelper.getCurrentOtherUser()!.email != null){
        return AppHelper.getCurrentOtherUser()!.email!;
      }else {
        return AppHelper.getCurrentOtherUser()!.family!.parentEmail!;
      }
    }
  }


  List<AppTheme> listThemes = [
    AppTheme(name: Const.KEY_THEME_DEFAULT, hexColor: 0xFFA1C2F5, isSelected: true),
    AppTheme(name: Const.KEY_THEME_BLUE, hexColor: 0xFF42A0E4, isSelected: false),
    AppTheme(name: Const.KEY_THEME_GREEN, hexColor: 0xFF23A757, isSelected: false),
    AppTheme(name: Const.KEY_THEME_YALLOW, hexColor: 0xFFF9BC12, isSelected: false),
    AppTheme(name: Const.KEY_THEME_DARK, hexColor: 0xFF212121, isSelected: false),
    AppTheme(name: Const.KEY_THEME_RED, hexColor: 0xFFFb3236, isSelected: false),
    AppTheme(name: Const.KEY_THEME_DARK_BLUE, hexColor: 0xFF0E3255, isSelected: false),
    AppTheme(name: Const.KEY_THEME_BROWN, hexColor: 0xFFC05E2B, isSelected: false),
    AppTheme(name: Const.KEY_THEME_ORANGE, hexColor: 0xFFF58A07, isSelected: false),
  ];

  List<Language> listLanguages = [
    Language(language: 'arabic', languageCode: Const.KEY_LANGUAGE_AR, isSelected: true),
    Language(language: 'english', languageCode: Const.KEY_LANGUAGE_EN, isSelected: false),
  ];

  void saveTheme(String color){
    print('saveTheme: $color');
    PreferencesManager.saveAppTheme(key: Const.KEY_THEME, theme: color);
    AppHelper.statusBarColor(isHome: true);
    update();
  }

  void saveLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    PreferencesManager.saveAppLanguage(key: Const.KEY_LANGUAGE, languageCode: codeLang);
    AppHelper.getAppTheme();
    Get.updateLocale(locale);
  }

  bool checkAppLanguage(){
    if(AppHelper.getAppLanguage() == Const.KEY_LANGUAGE_AR) {
      return true;
    } else if (AppHelper.getAppLanguage() == Const.KEY_LANGUAGE_EN) {
      return true;
    } else {
      return false;
    }
  }

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 320,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(height: 20),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'logout' : 'login', fontSize: Platform.isAndroid ? 20 : 16, fontWeight: FontWeight.w700),
                SizedBox(height: 14),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'text_log_out' : 'please_login',
                    fontSize: Platform.isAndroid ? 16 : 13,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsetsDirectional.only(top: 30, end: 10),
                          width: double.infinity,
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppHelper.getAppTheme(),
                              borderColor: AppHelper.getAppTheme(),
                              text: AppHelper.getCurrentUserToken() != null ? 'logout'.tr : 'login'.tr,
                              isUpperCase: false,
                              click: () {
                                if(AppHelper.getCurrentUserToken() != null) {
                                  logout();
                                } else {
                                  AppHelper.goToLogin();
                                }
                              })),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin:
                          const EdgeInsetsDirectional.only(top: 30, start: 10),
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.lightWhite,
                              borderColor: AppHelper.getAppTheme(),
                              text: 'cancel'.tr,
                              textColor: AppHelper.getAppTheme(),
                              isUpperCase: false,
                              click: () => Navigator.pop(context))),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }

  void logout() async {

    await ApiRequestes.logout(token: AppHelper.getCurrentUserToken()!)
        .then((value) {
          if(value != null){
            PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
            PreferencesManager.clearData(key: Const.KEY_USER_TYPE);
            PreferencesManager.clearData(key: Const.KEY_PARENT_USER_DATA);
            PreferencesManager.clearData(key: Const.KEY_OTHER_USER_DATA);
            HomeController controller = Get.put(HomeController());
            controller.getCurrenNavIndex(navIndex: 0);
            Get.offAndToNamed(Routes.login);
          }
    });

  }
}