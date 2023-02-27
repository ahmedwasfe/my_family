import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_family/controller/create_account_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';

class AddMembersScreen extends GetView<CreateAccountController> {
  CreateAccountController controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'add_new_members',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(
              AppHelper.iconBack(),
              height: 26.h,
              width: 26.w,
              fit: BoxFit.scaleDown,
            ),
            onTap: () => Navigator.maybePop(context)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsetsDirectional.only(start: 16, top: 46),
                child: AppText.medium(text: 'member_type'),
              ),
              //TODO Drop Down member type :
              Container(
                margin: const EdgeInsetsDirectional.only(start: 16, top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<CreateAccountController>(
                        builder: (controller) => Container(
                              width: 180.w,
                              height: 50.h,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Obx(() => AppText.medium(
                                        text:
                                            controller.MemberTypeSelected.value,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppHelper.getAppTheme(),
                                      )),
                                  items: controller.listMemberType
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              '$item',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppHelper.getAppTheme(),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.MemberTypeSelected.value =
                                        value.toString();
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 32,
                                    color: Color(0xff000000),
                                  ),
                                  iconSize: 14.sp,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  buttonHeight: 50.h,
                                  buttonWidth: 40.w,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      border: Border.all(
                                        color: AppColors.colorInputBorder,
                                        width: 0.5,
                                      ),
                                      color: Colors.white),
                                  itemHeight: 50,
                                  dropdownMaxHeight: 180,
                                  dropdownWidth: 180,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(10, 0),
                                ),
                              ),
                            )),
                  ],
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsetsDirectional.only(start: 16, top: 16),
                child: AppText.medium(text: 'how_many_helpers'),
              ),
              //TODO Drop Down How many helpers?
              Container(
                margin: const EdgeInsetsDirectional.only(start: 16, top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<CreateAccountController>(
                        builder: (controller) => Container(
                              width: 180.w,
                              height: 50.h,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Obx(() => AppText.medium(
                                        text: controller.helperSelected.value,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppHelper.getAppTheme(),
                                      )),
                                  items: controller.listHelpersCount
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              '$item',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppHelper.getAppTheme(),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.helperSelected.value =
                                        value.toString();
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 32,
                                    color: Color(0xff000000),
                                  ),
                                  iconSize: 14.sp,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  buttonHeight: 50.h,
                                  buttonWidth: 40.w,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      border: Border.all(
                                        color: AppColors.colorInputBorder,
                                        width: 0.5,
                                      ),
                                      color: Colors.white),
                                  itemHeight: 50,
                                  dropdownMaxHeight: 180,
                                  dropdownWidth: 180,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(10, 0),
                                ),
                              ),
                            )),
                  ],
                ),
              ),
              //TODO TEXT FAILD ADDRESS
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 16, top: 16, end: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(
                            text: 'email_address',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      SizedBox(height: 8.h),
                      GetBuilder<CreateAccountController>(
                          builder: (controller) => TextFormField(
                                controller: controller.emailonecontroller,
                                textInputAction: TextInputAction.go,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppHelper.getAppTheme(),
                                cursorWidth: 1.3.w,
                                cursorRadius: const Radius.circular(26).r,
                                enabled: true,
                                textAlignVertical:
                                    AppHelper.getTextAlignVertical(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: 'enter_your_email'.tr,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                    fillColor: const Color(0xffFFFFFF),
                                    filled: true,
                                    helperMaxLines: 2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorInputBorder,
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppHelper.getAppTheme(),
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 50.h,
                                      minWidth: 48.w,
                                    )),
                                validator: (email) =>
                                    AppHelper.validateEmail(email: email),
                              )),
                    ],
                  ),
                ),
              ),
              //TODO TEXT FAILD ADDRESS
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 16, top: 16, end: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(
                            text: 'email_address',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      SizedBox(height: 8.h),
                      GetBuilder<CreateAccountController>(
                          builder: (controller) => TextFormField(
                                controller: controller.emailTwocontroller,
                                textInputAction: TextInputAction.go,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppHelper.getAppTheme(),
                                cursorWidth: 1.3.w,
                                cursorRadius: const Radius.circular(26).r,
                                enabled: true,
                                textAlignVertical:
                                    AppHelper.getTextAlignVertical(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: 'enter_your_email'.tr,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                    fillColor: const Color(0xffFFFFFF),
                                    filled: true,
                                    helperMaxLines: 2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorInputBorder,
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppHelper.getAppTheme(),
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 50.h,
                                      minWidth: 48.w,
                                    )),
                                validator: (email) =>
                                    AppHelper.validateEmail(email: email),
                              )),
                    ],
                  ),
                ),
              ),
              //TODO TEXT FAILD ADDRESS
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(
                      start: 16, top: 16, end: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(
                            text: 'email_address',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      SizedBox(height: 8.h),
                      GetBuilder<CreateAccountController>(
                          builder: (controller) => TextFormField(
                                controller: controller.emailThreecontroller,
                                textInputAction: TextInputAction.go,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppHelper.getAppTheme(),
                                cursorWidth: 1.3.w,
                                cursorRadius: const Radius.circular(26).r,
                                enabled: true,
                                textAlignVertical:
                                    AppHelper.getTextAlignVertical(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: 'enter_your_email'.tr,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                    fillColor: const Color(0xffFFFFFF),
                                    filled: true,
                                    helperMaxLines: 2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorInputBorder,
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppHelper.getAppTheme(),
                                          width: 1.w),
                                      borderRadius: BorderRadius.circular(26).r,
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 50.h,
                                      minWidth: 48.w,
                                    )),
                                validator: (email) =>
                                    AppHelper.validateEmail(email: email),
                              )),
                    ],
                  ),
                ),
              ),
              //TODO BUTTON
              Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 54),
                child: AppWidgets.CustomButton(
                  text: 'save',
                  click: () {},
                  background: AppHelper.getAppTheme(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
