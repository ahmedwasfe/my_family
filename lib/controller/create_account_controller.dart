import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/model/auth/child_selected.dart';
import 'package:my_family/model/auth/helper_selected.dart';
import 'package:my_family/model/helper/helper_permissions.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/ui/auth/create_account/pages/children_info_page.dart';
import 'package:my_family/ui/auth/create_account/pages/family_info_page.dart';
import 'package:my_family/ui/auth/create_account/pages/helper_info_page.dart';
import 'package:my_family/ui/auth/create_account/pages/personal_info_page.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';

class CreateAccountController extends GetxController {
  final PageController pageController = PageController();

  final List<Widget> listPages = [
    PersonalInfoPage(),
    FamilyInfoPage(),
    HelperInfoPage(),
    ChildrenInfoPage()
  ];

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  bool isVisibleFamilyPass = true;
  bool isVisibleConfirmPass = true;

  RxString helperSelected = '1'.obs;
  RxString childSelected = '1'.obs;

  RxString MemberTypeSelected = 'G'.obs;
  List<String> listHelpersCount = [
    '1',
    '2',
    '3',
    '4',
  ];

  List<String> listMemberType= [
    'Ahmed',
    'M',
    'D',
    'E',
  ];


  List<PermissionData> listPermissions = [];
  List<HelperSelected> listHelperSelected = [];
  List<ChildSelected> listChildSelected = [];
  List<int> selectedIndexes1 = [];
  List<int> selectedIndexes2 = [];
  List<int> selectedIndexes3 = [];
  List<int> selectedIndexes4 = [];

  bool getSelectedIndexes(int index, int id) {
    if (index == 0) {
      return selectedIndexes1.contains(id);
    } else if (index == 1) {
      return selectedIndexes2.contains(id);
    } else if (index == 2) {
      return selectedIndexes3.contains(id);
    } else if (index == 3) {
      return selectedIndexes4.contains(id);
    } else {
      return false;
    }
  }

  void setSelectedIndexes(int index, int id) {
    if (index == 0) {
      if (selectedIndexes1.contains(id)) {
        selectedIndexes1.remove(id); // TODO unselect
      } else {
        selectedIndexes1.add(id); // TODO select
      }
    } else if (index == 1) {
      if (selectedIndexes2.contains(id)) {
        selectedIndexes2.remove(id); // TODO unselect
      } else {
        selectedIndexes2.add(id); // TODO select
      }
    } else if (index == 2) {
      if (selectedIndexes3.contains(id)) {
        selectedIndexes3.remove(id); // TODO unselect
      } else {
        selectedIndexes3.add(id); // TODO select
      }
    } else if (index == 3) {
      if (selectedIndexes4.contains(id)) {
        selectedIndexes4.remove(id); // TODO unselect
      } else {
        selectedIndexes4.add(id); // TODO select
      }
    }
    update();
  }

  List<String> listChildrenCount = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  IconData visiblePassIcon = Icons.visibility;
  IconData visibleFamilyPassIcon = Icons.visibility;
  IconData visibleConfirmPassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;

  // TODO Personal Info
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController otherParentNameController;
  late TextEditingController otherParentEmailController;


  // TODO Family Info
  late TextEditingController familyNameController;
  late TextEditingController familyPasswordController;
  late TextEditingController confirmPasswordController;

  // TODO Helper Info
  late TextEditingController helperEmail1Controller;
  late TextEditingController helperEmail2Controller;
  late TextEditingController helperEmail3Controller;
  late TextEditingController helperEmail4Controller;


 // TODO Family Password
  late TextEditingController NewPasswordController;
  late TextEditingController ConfirmPasswordController;

  // TODO New family username
  late TextEditingController NewFamilyUserNamecontroller;



  // TODO Add new members
  late TextEditingController emailonecontroller;
  late TextEditingController emailTwocontroller;
  late TextEditingController emailThreecontroller;



  TextEditingController? getEntertainmentController(int index) {
    if (index == 0) {
      return helperEmail1Controller;
    } else if (index == 1) {
      return helperEmail2Controller;
    } else if (index == 2) {
      return helperEmail3Controller;
    } else if (index == 3) {
      return helperEmail4Controller;
    } else {
      return null;
    }
  }

  // TODO Children Info
  late TextEditingController childrenEmail1Controller;
  late TextEditingController childrenEmail2Controller;
  late TextEditingController childrenEmail3Controller;
  late TextEditingController childrenEmail4Controller;
  late TextEditingController childrenEmail5Controller;
  late TextEditingController childrenEmail6Controller;
  late TextEditingController childrenEmail7Controller;
  late TextEditingController childrenEmail8Controller;

  TextEditingController? getChildrenController(int index) {
    if (index == 0) {
      return childrenEmail1Controller;
    } else if (index == 1) {
      return childrenEmail2Controller;
    } else if (index == 2) {
      return childrenEmail3Controller;
    } else if (index == 3) {
      return childrenEmail4Controller;
    } else if (index == 4) {
      return childrenEmail5Controller;
    } else if (index == 5) {
      return childrenEmail6Controller;
    } else if (index == 6) {
      return childrenEmail7Controller;
    } else if (index == 7) {
      return childrenEmail8Controller;
    } else
      return null;
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();

    // TODO Personal Info
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    otherParentNameController = TextEditingController();
    otherParentEmailController = TextEditingController();

    // TODO Family Info
    familyNameController = TextEditingController();
    familyPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    // TODO Helper Info
    helperEmail1Controller = TextEditingController();
    helperEmail2Controller = TextEditingController();
    helperEmail3Controller = TextEditingController();
    helperEmail4Controller = TextEditingController();

    // TODO Children Info
    childrenEmail1Controller = TextEditingController();
    childrenEmail2Controller = TextEditingController();
    childrenEmail3Controller = TextEditingController();
    childrenEmail4Controller = TextEditingController();
    childrenEmail5Controller = TextEditingController();
    childrenEmail6Controller = TextEditingController();
    childrenEmail7Controller = TextEditingController();
    childrenEmail8Controller = TextEditingController();

    // TODO Family Password
    NewPasswordController = TextEditingController();
    ConfirmPasswordController = TextEditingController();

    // TODO New family username
    NewFamilyUserNamecontroller = TextEditingController();


    // TODO Add new members
    emailonecontroller=TextEditingController();
    emailTwocontroller=TextEditingController();
    emailThreecontroller=TextEditingController();
    super.onInit();

    // helperEmail1Controller.text = 'ahmed.helper@mail.com';
    // helperEmail2Controller.text = 'mohammed.helper@mail.com';
    //
    // childrenEmail1Controller.text = 'ahmed.child@mail.com';
    // childrenEmail2Controller.text = 'mohammed.child@mail.com';
    // childrenEmail3Controller.text = 'sara.child@mail.com';
    // childrenEmail4Controller.text = 'dalia.child@mail.com';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();

    // TODO Personal Info
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otherParentNameController.dispose();
    otherParentEmailController.dispose();

    // TODO Family Info
    familyNameController.dispose();
    familyPasswordController.dispose();
    confirmPasswordController.dispose();

    // TODO Helper Info
    helperEmail1Controller.dispose();
    helperEmail2Controller.dispose();
    helperEmail3Controller.dispose();
    helperEmail4Controller.dispose();

    // TODO Children Info
    childrenEmail1Controller.dispose();
    childrenEmail2Controller.dispose();
    childrenEmail3Controller.dispose();
    childrenEmail4Controller.dispose();
    childrenEmail5Controller.dispose();
    childrenEmail6Controller.dispose();
    childrenEmail7Controller.dispose();
    childrenEmail8Controller.dispose();

    // TODO Family Password
    NewPasswordController.dispose();
    ConfirmPasswordController.dispose();

    // TODO New family username
    NewFamilyUserNamecontroller.dispose();

    // TODO Add new members
    emailonecontroller.dispose();
    emailTwocontroller.dispose();
    emailThreecontroller.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleFamilyPassword() {
    isVisibleFamilyPass = !isVisibleFamilyPass;
    visibleFamilyPassIcon =
        isVisibleFamilyPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon =
        isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  Future<void> getHelperPermissions() async {
    await ApiRequestes.getHelperPermissions(
            language: AppHelper.getAppLanguage())
        .then((value) {
      if (value != null) {
        listPermissions.clear();
        listPermissions.addAll(value.result!.permissions!);
      }
    });
  }

  void verifyPersonalInfo() {
    if (nameController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_personal_data', message: 'please_enter_your_name');
    } else if (emailController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_personal_data', message: 'please_enter_your_email');
    } else if (!AppHelper.emailValidate().hasMatch(emailController.text)) {
      AppHelper.showSnackBar(
          title: 'verify_personal_data', message: 'please_enter_valid_email');
    } else if (passwordController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_personal_data', message: 'please_enter_password');
    } else if (passwordController.text.length < 6) {
      AppHelper.showSnackBar(
          title: 'verify_personal_data', message: 'password_6_characters');
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 750),
          curve: Curves.easeInToLinear);
    }
  }

  void verifyFamilyInfo() {
    if (familyNameController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_family_data',
          message: 'please_enter_your_family_name');
    } else if (familyPasswordController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_family_data',
          message: 'please_enter_your_family_password');
    } else if (familyPasswordController.text.length < 6) {
      AppHelper.showSnackBar(
          title: 'verify_family_data', message: 'password_6_characters');
    } else if (confirmPasswordController.text.isEmpty) {
      AppHelper.showSnackBar(
          title: 'verify_family_data',
          message: 'please_enter_confirm_password');
    } else if (confirmPasswordController.text.length < 6) {
      AppHelper.showSnackBar(
          title: 'verify_family_data', message: 'password_6_characters');
    } else if (familyPasswordController.text !=
        confirmPasswordController.text) {
      AppHelper.showSnackBar(
          title: 'verify_family_data', message: 'passwords_not_match');
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 750),
          curve: Curves.easeInToLinear);
    }
  }

  void verifyHelpersInfo() {
    if (helperSelected.value == '1') {
      if (helperEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_first_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail1Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes1.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_first_helper_permissions');
      } else {
        HelperSelected helper1 = HelperSelected(
            email: helperEmail1Controller.text,
            permission: jsonEncode(selectedIndexes1));
        listHelperSelected.add(helper1);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInToLinear);
      }
    } else if (helperSelected.value == '2') {
      if (helperEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_first_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail1Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes1.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_first_helper_permissions');
      } else if (helperEmail2Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_second_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail2Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes2.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_second_helper_permissions');
      } else {
        HelperSelected helper1 = HelperSelected(
            email: helperEmail1Controller.text,
            permission: jsonEncode(selectedIndexes1));
        HelperSelected helper2 = HelperSelected(
            email: helperEmail2Controller.text,
            permission: jsonEncode(selectedIndexes2));
        listHelperSelected.add(helper1);
        listHelperSelected.add(helper2);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInToLinear);
      }
    } else if (helperSelected.value == '3') {
      if (helperEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_first_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail1Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes1.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_first_helper_permissions');
      } else if (helperEmail2Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_second_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail2Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes2.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_second_helper_permissions');
      } else if (helperEmail3Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_third_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail3Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes3.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_third_helper_permissions');
      } else {
        HelperSelected helper1 = HelperSelected(
            email: helperEmail1Controller.text,
            permission: jsonEncode(selectedIndexes1));
        HelperSelected helper2 = HelperSelected(
            email: helperEmail2Controller.text,
            permission: jsonEncode(selectedIndexes2));
        HelperSelected helper3 = HelperSelected(
            email: helperEmail3Controller.text,
            permission: jsonEncode(selectedIndexes3));
        listHelperSelected.add(helper1);
        listHelperSelected.add(helper2);
        listHelperSelected.add(helper3);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInToLinear);
      }
    } else if (helperSelected.value == '4') {
      if (helperEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_first_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail1Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes1.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_first_helper_permissions');
      } else if (helperEmail2Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_second_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail2Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes2.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_second_helper_permissions');
      } else if (helperEmail3Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_third_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail3Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes3.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_third_helper_permissions');
      } else if (helperEmail4Controller.text.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_enter_fourth_helper_email');
      } else if (!AppHelper.emailValidate()
          .hasMatch(helperEmail4Controller.text)) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data', message: 'please_enter_valid_email');
      } else if (selectedIndexes4.isEmpty) {
        AppHelper.showSnackBar(
            title: 'verify_helpers_data',
            message: 'please_select_fourth_helper_permissions');
      } else {
        HelperSelected helper1 = HelperSelected(
            email: helperEmail1Controller.text,
            permission: jsonEncode(selectedIndexes1));
        HelperSelected helper2 = HelperSelected(
            email: helperEmail2Controller.text,
            permission: jsonEncode(selectedIndexes2));
        HelperSelected helper3 = HelperSelected(
            email: helperEmail3Controller.text,
            permission: jsonEncode(selectedIndexes3));
        HelperSelected helper4 = HelperSelected(
            email: helperEmail4Controller.text,
            permission: jsonEncode(selectedIndexes4));
        listHelperSelected.add(helper1);
        listHelperSelected.add(helper2);
        listHelperSelected.add(helper3);
        listHelperSelected.add(helper4);
        pageController.nextPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInToLinear);
      }
    } else {
      AppHelper.showSnackBar(
          title: 'verify_helpers_data', message: 'must_select_one_helper');
    }
    // print(
    //     'HELPERS PERMISSIONS: helper_permission${jsonEncode(listHelperSelected)}');
  }

  bool verifyChildrenInfo() {

    if (childSelected.value == '1') {

      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        listChildSelected.add(child1);
        return true;
      }
    }else if(childSelected.value == '2'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        return true;
      }
    }else if(childSelected.value == '3'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        return true;
      }
    }else if(childSelected.value == '4'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail4Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fourth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail4Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        ChildSelected child4 = ChildSelected(email: childrenEmail4Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        listChildSelected.add(child4);
        return true;
      }
    }else if(childSelected.value == '5'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail4Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fourth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail4Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail5Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fivth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail5Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        ChildSelected child4 = ChildSelected(email: childrenEmail4Controller.text);
        ChildSelected child5 = ChildSelected(email: childrenEmail5Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        listChildSelected.add(child4);
        listChildSelected.add(child5);
        return true;
      }
    }else if(childSelected.value == '6'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail4Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fourth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail4Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail5Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fivth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail5Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail6Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_sixth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail6Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        ChildSelected child4 = ChildSelected(email: childrenEmail4Controller.text);
        ChildSelected child5 = ChildSelected(email: childrenEmail5Controller.text);
        ChildSelected child6 = ChildSelected(email: childrenEmail6Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        listChildSelected.add(child4);
        listChildSelected.add(child5);
        listChildSelected.add(child6);
        return true;
      }
    }else if(childSelected.value == '7'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail4Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fourth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail4Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail5Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fivth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail5Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail6Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_sixth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail6Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail7Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_sevnth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail7Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        ChildSelected child4 = ChildSelected(email: childrenEmail4Controller.text);
        ChildSelected child5 = ChildSelected(email: childrenEmail5Controller.text);
        ChildSelected child6 = ChildSelected(email: childrenEmail6Controller.text);
        ChildSelected child7 = ChildSelected(email: childrenEmail7Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        listChildSelected.add(child4);
        listChildSelected.add(child5);
        listChildSelected.add(child6);
        listChildSelected.add(child7);
        return true;
      }
    }else if(childSelected.value == '8'){
      if (childrenEmail1Controller.text.isEmpty) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_first_child_email');
        return false;
      } else if (!AppHelper.emailValidate().hasMatch(childrenEmail1Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail2Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_second_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail2Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail3Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_third_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail3Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail4Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fourth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail4Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail5Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_fivth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail5Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail6Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_sixth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail6Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail7Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_sevnth_child_email');
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail7Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      }else if(childrenEmail8Controller.text.isEmpty){
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_eighth_child_email');
        return false;
        return false;
      }else if (!AppHelper.emailValidate().hasMatch(childrenEmail8Controller.text)) {
        AppHelper.showSnackBar(title: 'verify_children_data', message: 'please_enter_valid_email');
        return false;
      } else {
        ChildSelected child1 = ChildSelected(email: childrenEmail1Controller.text);
        ChildSelected child2 = ChildSelected(email: childrenEmail2Controller.text);
        ChildSelected child3 = ChildSelected(email: childrenEmail3Controller.text);
        ChildSelected child4 = ChildSelected(email: childrenEmail4Controller.text);
        ChildSelected child5 = ChildSelected(email: childrenEmail5Controller.text);
        ChildSelected child6 = ChildSelected(email: childrenEmail6Controller.text);
        ChildSelected child7 = ChildSelected(email: childrenEmail7Controller.text);
        ChildSelected child8 = ChildSelected(email: childrenEmail8Controller.text);
        listChildSelected.add(child1);
        listChildSelected.add(child2);
        listChildSelected.add(child3);
        listChildSelected.add(child4);
        listChildSelected.add(child5);
        listChildSelected.add(child6);
        listChildSelected.add(child7);
        listChildSelected.add(child8);
        return true;
      }
    }else{
      AppHelper.showSnackBar(
          title: 'verify_children_data', message: 'must_select_one_child');
      return false;
    }
  }

  void createAccount() async {

    // TODO FAMILY AHM FAM
    // TODO PARENT ahmed.parent@gmail.com
    // TODO OTHER other.ahm.parent@gmail.com
    // TODO HELPER ahm.helper@gmail.com
    // TODO CHILD ahm.child@gmail.com
    // TODO PASS 12345678
    isLoading(true);
    if(verifyChildrenInfo()){
      await ApiRequestes.createAccount(
          parentName: nameController.text,
          parentEmail: emailController.text,
          otherParentName: otherParentNameController.text,
          otherParentEmail: otherParentEmailController.text,
          password: passwordController.text,
          familName: familyNameController.text,
          familyPassword: familyPasswordController.text,
          helpersNo: helperSelected.value,
          childrenNo: childSelected.value,
          language: AppHelper.getAppLanguage(),
          helpers: listHelperSelected,
          children: listChildSelected)
          .then((value) {
        if (value != null) {
          isLoading(false);
          PreferencesManager.saveParentData(key: Const.KEY_PARENT_USER_DATA, user: value.result!.user!);
          PreferencesManager.saveAppData(key: Const.KEY_USER_TYPE, value: value.result!.guard);
          PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: value.result!.token!)
              .then((value) => Get.offAndToNamed(Routes.home));
          clearData();
        }else {
          isLoading(false);
        }
      }, onError: (error) {
        print('onError: ${error.toString()}');
        isLoading(false);
      }).catchError((error) {
        print('catchError: ${error.toString()}');
        isLoading(false);
      });
    }else {
      isLoading(false);
    }
  }

  void clearData(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    otherParentNameController.clear();
    otherParentEmailController.clear();
    familyNameController.clear();
    familyPasswordController.clear();
    confirmPasswordController.clear();
    helperEmail1Controller.clear();
    helperEmail2Controller.clear();
    helperEmail3Controller.clear();
    helperEmail4Controller.clear();
    listHelperSelected.clear();
    selectedIndexes1.clear();
    selectedIndexes2.clear();
    selectedIndexes3.clear();
    selectedIndexes4.clear();
    childrenEmail1Controller.clear();
    childrenEmail2Controller.clear();
    childrenEmail3Controller.clear();
    childrenEmail4Controller.clear();
    childrenEmail5Controller.clear();
    childrenEmail6Controller.clear();
    childrenEmail7Controller.clear();
    childrenEmail8Controller.clear();
  }
}
