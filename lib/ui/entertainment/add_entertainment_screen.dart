import 'dart:io';

import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/entertainments_controller.dart';
import 'package:my_family/localDB/model/save_entertainments.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';

class AddEntertainmentScreen extends StatelessWidget {

  final _controller = Get.put(EntertainmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'add_entertainment', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Get.offAndToNamed(Routes.entertainments)),

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 60.r, start: 16.r, end: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(text:'add_title_entertainment',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: GetBuilder<EntertainmentsController>(builder: (controller) => TextFormField(
                            controller: controller.titleEnterainmentsController,
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.emailAddress,
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
                                hintText: 'add_title'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400
                                ),
                                fillColor: const Color(0xffFFFFFF),
                                filled: true,
                                helperMaxLines: 2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.colorInputBorder, width: 1.w),
                                  borderRadius: BorderRadius.circular(26).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                                  borderRadius: BorderRadius.circular(26).r,
                                ),
                                constraints: BoxConstraints(
                                  maxHeight: 50.h,
                                  minWidth: 48.w,
                                )),
                            validator: (email) => AppHelper.validateEmail(email: email),
                          )),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          child: GetBuilder<EntertainmentsController>(builder: (controller) => Container(
                              height: 70.h,
                              width: 80.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: controller.enterainmentImage == null
                                  ? Image.asset('${Const.images}select_image.png', fit: BoxFit.cover)
                                  : Image.file(File(controller.enterainmentImage!.path), fit: BoxFit.cover))
                          ),
                          onTap: () => _controller.requestStoragePermission(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 25.r, start: 16.r, end: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(text:'add_suggestion',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: GetBuilder<EntertainmentsController>(builder: (controller) => TextFormField(
                            controller: controller.enterainmentSuggeestionController,
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.emailAddress,
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
                                hintText: 'add_suggestion'.tr,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400
                                ),
                                fillColor: const Color(0xffFFFFFF),
                                filled: true,
                                helperMaxLines: 2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.colorInputBorder, width: 1.w),
                                  borderRadius: BorderRadius.circular(26).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                                  borderRadius: BorderRadius.circular(26).r,
                                ),
                                constraints: BoxConstraints(
                                  maxHeight: 50.h,
                                  minWidth: 48.w,
                                )),
                            validator: (email) => AppHelper.validateEmail(email: email),
                          )),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton(
                          backgroundColor: AppHelper.getAppTheme(),
                            mini: true,
                            child: const Icon(Icons.add),
                            onPressed: () async {
                              await _controller.saveEntertainmentsToLocalDB();
                            })
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:const EdgeInsetsDirectional.only(start: 20, top: 25, bottom: 20),
                child: AppText.medium(text: 'add_suggestions',
                fontWeight: FontWeight.w400,
                fontSize: 14),
              ),
              GetBuilder<EntertainmentsController>(builder: (controller) => FutureBuilder(
                  future: _controller.getAllEntertainments(),
                  builder: (context, snapshot) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.listSuggestions.length,
                      itemBuilder: (context, index) => buildSuggestionsItem(_controller.listSuggestions[index])))),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 40, bottom: 56),
                alignment: AlignmentDirectional.center,
                child: AppWidgets.CustomButton(
                    width: 300.w,
                    height: 48.h,
                    radius: 14.r,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    fontWeight: FontWeight.w700,
                    isUpperCase: false,
                    text: 'save'.tr, click: () => _controller.addEntertainment()),
              ),
              Obx(() => _controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())
            ],
          ),
        ),
      ),
    );
  }

  buildSuggestionsItem(SaveEntertainments entertainment) => Container(
    margin: const EdgeInsetsDirectional.only(top: 4, bottom: 4, start: 12, end: 12),
    decoration: BoxDecoration(
        color: AppColors.colorBack,
      borderRadius: BorderRadius.circular(8)
    ),
    child: Row(
      children: [
        GetBuilder<EntertainmentsController>(
            builder: (controller) => CustomCheckBox(
                borderRadius: 20,
                value: controller.selectedSuggestions.contains(entertainment.title),
                checkedFillColor: AppHelper.getAppTheme(),
                splashColor: AppHelper.getAppTheme(),
                borderColor: Colors.white,
                splashRadius: 9,
                onChanged: (val) {
                  if (controller.selectedSuggestions.contains(entertainment.title)) {
                    controller.selectedSuggestions.remove(entertainment.title); // TODO unselect
                  } else {
                    controller.selectedSuggestions.add(entertainment.title!); // TODO select
                  }
                  controller.update();
                })),
        AppText.medium(
            text:
            entertainment.title!,
            fontWeight: FontWeight.w400),
        Spacer(),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
          child: InkWell(
            child: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
            onTap: () => _controller.deleteEntertainments(id: entertainment.id!),
          ),
        )
      ],
    ),
  );
}
