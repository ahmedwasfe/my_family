import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/study_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';

class AddStudyScreen extends GetView<StudyController> {
  final _controller = Get.put(StudyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.colorBackground,
        appBar: AppBar(
          backgroundColor: AppHelper.getAppTheme(),
          elevation: 0,
          title: AppText.medium(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              text: 'add_study',
              color: Colors.white),
          toolbarHeight: 60.h,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.maybePop(context)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:const EdgeInsetsDirectional.only(start: 16,top: 30),
                  child: AppText.medium(text: 'choose-child_assignment',
                  fontSize:14 ,
                  fontWeight:FontWeight.w400),
                ),
                GetBuilder<StudyController>(
                    builder: (controller) => Container(
                      margin:const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16),
                      width: double.infinity.w,
                      height: 50.h,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Obx(() => AppText.medium(
                            text: controller
                                .AssignmentSelected.value,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppHelper.getAppTheme(),
                          )),
                          items: controller.listAssignmentCount
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  '$item',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: AppHelper
                                        .getAppTheme(),
                                  ),
                                  overflow:
                                  TextOverflow.ellipsis,
                                ),
                              ))
                              .toList(),
                          onChanged: (value) {
                            controller.AssignmentSelected.value =
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
                              borderRadius:
                              BorderRadius.circular(26),
                              border: Border.all(
                                color:
                                AppColors.colorInputBorder,
                                width: 0.5,
                              ),
                              color: Colors.white),
                          itemHeight: 50,
                          dropdownMaxHeight: 180,
                          dropdownWidth: 180,
                          dropdownDecoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(10, 0),
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 16,top: 16),
                  child: AppText.medium(text: 'how_many_subjects',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
                ),
                GetBuilder<StudyController>(
                    builder: (controller) => Container(
                      margin: const EdgeInsetsDirectional.only(top: 13,start: 16),
                      width: 180.w,
                      height: 50.h,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Obx(() => AppText.medium(
                            text: controller
                                .helperSelected.value,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppHelper.getAppTheme(),
                          )),
                          items: controller.listHelpersCount
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  '$item',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: AppHelper
                                        .getAppTheme(),
                                  ),
                                  overflow:
                                  TextOverflow.ellipsis,
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
                              borderRadius:
                              BorderRadius.circular(26),
                              border: Border.all(
                                color:
                                AppColors.colorInputBorder,
                                width: 0.5,
                              ),
                              color: Colors.white),
                          itemHeight: 50,
                          dropdownMaxHeight: 180,
                          dropdownWidth: 180,
                          dropdownDecoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(10, 0),
                        ),
                      ),
                    )),



                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 16,top: 16),
                          child: AppText.medium(text: 'add_title_Subject',
                              fontSize:14 ,
                              fontWeight:FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<StudyController>(
                            builder: (controller) => TextFormField(
                              controller: controller.TitleOneController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.name,
                              cursorColor: AppHelper.getAppTheme(),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(26).r,
                              enabled: true,
                              textAlignVertical: AppHelper.getTextAlignVertical(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'add_title_Subject'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffFFFFFF),
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorInputBorder, width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppHelper.getAppTheme(), width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    minWidth: 48.w,
                                  )),
                              // validator: (email) => AppHelper.validateEmail(email: email),
                            )),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 16,top: 15),
                          child: AppText.medium(text: 'add_title_Subject',
                              fontSize:14 ,
                              fontWeight:FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<StudyController>(
                            builder: (controller) => TextFormField(
                              controller: controller.TitleTwoController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.name,
                              cursorColor: AppHelper.getAppTheme(),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(26).r,
                              enabled: true,
                              textAlignVertical: AppHelper.getTextAlignVertical(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'add_title_Subject'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffFFFFFF),
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorInputBorder, width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppHelper.getAppTheme(), width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    minWidth: 48.w,
                                  )),
                              // validator: (email) => AppHelper.validateEmail(email: email),
                            )),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 16,top: 15),
                          child: AppText.medium(text: 'add_title_Subject',
                              fontSize:14 ,
                              fontWeight:FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<StudyController>(
                            builder: (controller) => TextFormField(
                              controller: controller.TitleThreeController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.name,
                              cursorColor: AppHelper.getAppTheme(),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(26).r,
                              enabled: true,
                              textAlignVertical: AppHelper.getTextAlignVertical(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'add_title_Subject'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffFFFFFF),
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorInputBorder, width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppHelper.getAppTheme(), width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    minWidth: 48.w,
                                  )),
                              // validator: (email) => AppHelper.validateEmail(email: email),
                            )),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 16,top: 15),
                          child: AppText.medium(text: 'add_title_Subject',
                              fontSize:14 ,
                              fontWeight:FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<StudyController>(
                            builder: (controller) => TextFormField(
                              controller: controller.TitleFourController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.name,
                              cursorColor: AppHelper.getAppTheme(),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(26).r,
                              enabled: true,
                              textAlignVertical: AppHelper.getTextAlignVertical(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'add_title_Subject'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffFFFFFF),
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorInputBorder, width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppHelper.getAppTheme(), width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    minWidth: 48.w,
                                  )),
                              // validator: (email) => AppHelper.validateEmail(email: email),
                            )),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 16,top: 15),
                          child: AppText.medium(text: 'add_title_Subject',
                              fontSize:14 ,
                              fontWeight:FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<StudyController>(
                            builder: (controller) => TextFormField(
                              controller: controller.TitleFiveController,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.name,
                              cursorColor: AppHelper.getAppTheme(),
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(26).r,
                              enabled: true,
                              textAlignVertical: AppHelper.getTextAlignVertical(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: 'add_title_Subject'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffFFFFFF),
                                  filled: true,
                                  helperMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorInputBorder, width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppHelper.getAppTheme(), width: 1.w),
                                    borderRadius: BorderRadius.circular(26).r,
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    minWidth: 48.w,
                                  )),
                              // validator: (email) => AppHelper.validateEmail(email: email),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:const EdgeInsetsDirectional.only(start: 14,end: 14,top: 20,bottom: 20),
                  child: AppWidgets.CustomButton(text: 'send', click: (){},
                    radius: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
