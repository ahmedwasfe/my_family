import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/settings_controller.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';
class HelpScreen extends GetView<SettingsController> {

  SettingsController controller=Get.put(SettingsController());
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
            text: 'help',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Navigator.maybePop(context)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key:controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO  Problem Title
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 10.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin:const EdgeInsetsDirectional.only(start: 16,top: 45),
                        child: AppText.medium(text: 'problem_title',fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(height: 12.h),
                      GetBuilder<SettingsController>(
                          builder: (controller) => TextFormField(
                            textInputAction: TextInputAction.go,
                            controller:
                            controller.ProblemController,
                            keyboardType: TextInputType.name,
                            cursorColor: AppHelper.getAppTheme(),
                            cursorWidth: 1.3.w,
                            cursorRadius: const Radius.circular(10).r,
                            enabled: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'khalil'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400),
                              fillColor: const Color(0xffFAFAFA),
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
                              ),
                            ),
                            // validator: (username) => AppHelper.validatePassword(password: username!),
                          )),
                    ],
                  ),
                ),
              ),
              //TODO  Explanation of the problem
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 18.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin:const EdgeInsetsDirectional.only(start: 16,top: 45),
                        child: AppText.medium(text: 'explanation_of_the_problem',fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(height: 12.h),
                      GetBuilder<SettingsController>(
                          builder: (controller) => TextFormField(
                            textInputAction: TextInputAction.go,
                            controller:
                            controller.ProblemController,
                            keyboardType: TextInputType.name,
                            cursorColor: AppHelper.getAppTheme(),
                            cursorWidth: 1.3.w,
                            cursorRadius: const Radius.circular(10).r,
                            enabled: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'enter_des_problem'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400),
                              fillColor: const Color(0xffFAFAFA),
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
                                maxWidth: 343.w,

                              ),
                            ),
                            // validator: (username) => AppHelper.validatePassword(password: username!),
                          )),
                    ],
                  ),
                ),
              ),
              //TODO Add a picture of the problem
              Container(
                margin: EdgeInsetsDirectional.only(start: 17.r,top: 16.r),
                child: Card(
                  elevation: 3,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width:
                    150.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(12).r,
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('${Const.icons}icon_camera.svg' , height: 40.h, width: 50.w,),
                        Container(
                          margin: EdgeInsetsDirectional.only(start: 5.r),
                          alignment: AlignmentDirectional.topStart,
                          child: AppText.medium(text: 'Add_picture_problem',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                            color:  AppHelper.getAppTheme(),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //TODO Button
              Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 54),
                child: AppWidgets.CustomButton(
                  text: 'save',
                  click: () {
                    Get.toNamed(Routes.AddMembers);
                  },
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
