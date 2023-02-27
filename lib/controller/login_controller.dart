import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/model/helper/helper.dart';
import 'package:my_family/model/parent.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';

class LoginController extends GetxController{

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController familyNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    familyNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
    // familyNameController.text = 'AHM FAM';
    // emailController.text = 'ahmed.parent@gmail.com';
    // passwordController.text = '12345678';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    familyNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void login({required String familyName, required String email, required String password}) {
    bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      ApiRequestes.login(
          familyName: familyName,
          email: email,
          password: password)
          .then((value) {
        if (value != null) {
          isLoading(false);

          Parent user = value.result!.user!;
          if(value.result!.guard != null){
            if(value.result!.guard == Const.KEY_FAMILY){
              PreferencesManager.saveParentData(key: Const.KEY_PARENT_USER_DATA, user: user);
              PreferencesManager.saveAppData(key: Const.KEY_USER_TYPE, value: value.result!.guard!);
              PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: value.result!.token!).then((value) => Get.offAndToNamed(Routes.home));
            }else if(value.result!.guard == Const.KEY_HELPER){
              loginOtherUser(familyName: familyName, email: email, password: password);
            }else if(value.result!.guard == Const.KEY_CHILD){
              loginOtherUser(familyName: familyName, email: email, password: password);
            }
          }

          familyNameController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          isLoading(false);
        }
      }).catchError((error) {
        isLoading(false);
        print('catchError: $error');
      });
    } else {
      isLoading(false);
    }
  }

  void loginOtherUser({required String familyName, required String email, required String password}) async {
    await ApiRequestes.loginOtherUser(familyName: familyName, email: email, password: password)
        .then((value) {
          if(value != null){
            if(value.result!.guard != null){
              if(value.result!.guard == Const.KEY_HELPER){
                PreferencesManager.saveOtherUserData(key: Const.KEY_OTHER_USER_DATA, user: value.result!.user!);
                PreferencesManager.saveAppData(key: Const.KEY_USER_TYPE, value: value.result!.guard!);
                PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: value.result!.token!).then((value) => Get.offAndToNamed(Routes.home));
              }else if(value.result!.guard == Const.KEY_CHILD){
                PreferencesManager.saveOtherUserData(key: Const.KEY_OTHER_USER_DATA, user: value.result!.user!);
                PreferencesManager.saveAppData(key: Const.KEY_USER_TYPE, value: value.result!.guard!);
                PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: value.result!.token!).then((value) => Get.offAndToNamed(Routes.home));
              }
            }
          }
    });
  }
}