import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/home_controller.dart';
import 'package:my_family/model/auth/other_auth.dart';
import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/helper/helper.dart';
import 'package:my_family/model/parent.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';
import 'preferences_manager.dart';

class AppHelper {
  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  static Parent? getCurrentParentUser() {
    if (PreferencesManager.getParentData(key: Const.KEY_PARENT_USER_DATA) != null) {
      return PreferencesManager.getParentData(key: Const.KEY_PARENT_USER_DATA);
    } else {
      return null;
    }
  }

  static OtherUser? getCurrentOtherUser() {
    if (PreferencesManager.getOtherUserData(key: Const.KEY_OTHER_USER_DATA) != null) {
      return PreferencesManager.getOtherUserData(key: Const.KEY_OTHER_USER_DATA);
    } else {
      return null;
    }
  }

  static String? getUserType() {
    if (PreferencesManager.getAppData(key: Const.KEY_USER_TYPE) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_USER_TYPE);
    } else {
      return null;
    }
  }

  static int getFamilyId() {
    if(getUserType() == Const.KEY_FAMILY){
      return getCurrentParentUser()!.id!;
    }else{
      return getCurrentOtherUser()!.id!;
    }
  }

  static String getAppLanguage() {
    if (PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE) != null &&
        PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE) != "") {
      String language = PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR) {
        return Const.KEY_LANGUAGE_AR;
      } else if (language == Const.KEY_LANGUAGE_EN) {
        return Const.KEY_LANGUAGE_EN;
      }
    }
    return Const.KEY_LANGUAGE_AR;
  }

  static Locale? getAppLocale() {
    String? language = PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE);
    if (language == Const.KEY_LANGUAGE_AR) {
      return const Locale('ar');
    } else if (language == Const.KEY_LANGUAGE_EN) {
      return const Locale('en');
    } else {
      return const Locale('ar');
    }
  }

  static Color getAppTheme() {
    if (PreferencesManager.getAppTheme(key: Const.KEY_THEME) != null &&
        PreferencesManager.getAppTheme(key: Const.KEY_THEME) != "") {
      String theme = PreferencesManager.getAppTheme(key: Const.KEY_THEME);
      if (theme == Const.KEY_THEME_DEFAULT) {
        return AppColors.colorAppMain;
      } else if (theme == Const.KEY_THEME_BLUE) {
        return AppColors.colorBlue;
      } else if (theme == Const.KEY_THEME_GREEN) {
        return AppColors.colorGreen;
      } else if (theme == Const.KEY_THEME_YALLOW) {
        return AppColors.colorYallow;
      } else if (theme == Const.KEY_THEME_DARK) {
        return AppColors.colorDark;
      } else if (theme == Const.KEY_THEME_RED) {
        return AppColors.colorRed;
      } else if (theme == Const.KEY_THEME_DARK_BLUE) {
        return AppColors.colorDarkBlue;
      } else if (theme == Const.KEY_THEME_BROWN) {
        return AppColors.colorBrown;
      } else if (theme == Const.KEY_THEME_ORANGE) {
        return AppColors.colorOrang;
      }
    }
    return AppColors.colorAppMain;
  }

  static Future initServices() async {
    await Get.putAsync(() => PreferencesManager().initial());
  }

  static Future saveDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }
  }

  static String getDeviceName() {
    if (PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME);
    } else {
      return '';
    }
  }

  static TextAlignVertical getTextAlignVertical(){
    return getAppLanguage() == 'ar' ? TextAlignVertical.bottom : TextAlignVertical.center;
  }

  static void showToast(
      {required String message,
      Color color = Colors.black,
      ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar({required String title, required String message}){
    Get.snackbar(
        title.tr,
        duration:
        const Duration(milliseconds: 2000),
        backgroundColor:
        Colors.grey.withOpacity(0.1),
        margin: const EdgeInsets.all(20),
        message.tr);
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateFamilyName({required String familyName}) {
    if (familyName.isEmpty) {
      return 'enter_your_family_name'.tr;
    } else {
      return null;
    }
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_phone'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!) {
      return 'Enter Confirm Password'.tr;
    } else if (conformPassword.length < 6) {
      return 'Password must be more than 6 characters'.tr;
    } else if (password != conformPassword) {
      return 'Passwords do not match'.tr;
    }
    return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!) {
      return 'enter email'.tr;
    } else if (!AppHelper.emailValidate().hasMatch(email)) {
      return 'Enter a valid email'.tr;
    } else {
      return null;
    }
  }

  static String formatImage(String pathImage) {
    if (pathImage.contains('\\')) {
      return pathImage.replaceAll('\\', '/');
    } else {
      return pathImage;
    }
  }

  static String getUserImage(String pathImage) {
    // print('getUserImage: $pathImage');
    if (pathImage.contains(Const.imagePath)) {
      return formatImage(pathImage);
    } else {
      return formatImage('${Const.imagePath}$pathImage');
    }
  }

  static String getUserLatitude() {
    print(
        'getUserLatitude :${PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE)}');
    if (PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE)
          .toString();
    } else {
      return '';
    }
  }

  static String getUserLongitude() {
    print(
        'getUserLongitude :${PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD)}');
    if (PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD)
          .toString();
    } else {
      return '';
    }
  }

  static int getPlaceItemSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* TODO PHONE */ 2
        : /* TODO TABLET */ 3;
  }

  static void showLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
              clipBehavior: Clip.antiAlias,
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                height: 300.h,
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsetsDirectional.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(
                        text: 'please_login'.tr,
                        color: AppHelper.getAppTheme(),
                        fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 8.r),
                        height: 150.h,
                        width: 230.w,
                        child: Image.asset('${Const.images}login.png',
                            fit: BoxFit.cover)),
                    Spacer(),
                    Container(
                        child: AppWidgets.CustomButton(
                            height: 52,
                            background: AppHelper.getAppTheme(),
                            borderColor: AppHelper.getAppTheme(),
                            text: 'login'.tr,
                            click: () {
                              goToLogin();
                            })),
                  ],
                ),
              ),
            ));
  }

  static void goToLogin() {
    // PreferencesManager.clearData(key: Const.KEY_LATITUDE);
    // PreferencesManager.clearData(key: Const.KEY_LONGITUD);
    PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
    PreferencesManager.clearData(key: Const.KEY_PARENT_USER_DATA);
    HomeController controller = Get.put(HomeController());
    controller.getCurrenNavIndex(navIndex: 0);
    Get.offAndToNamed(Routes.login);
  }

  static String iconBack(){
    return getAppLanguage() == 'ar' ? '${Const.icons}icon_back_ar.svg' : '${Const.icons}icon_back_en.svg';
  }

  static void statusBarColor({required bool isHome}){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: AppHelper.getAppTheme(),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  }
}
