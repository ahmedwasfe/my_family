import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/create_account_controller.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/ui/auth/create_account/add_members_screen.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';

class FamilyUserNameScreen extends GetView<CreateAccountController> {
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
            text: 'family_password',
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
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TODO TEXT
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsetsDirectional.only(start: 16, top: 111),
                child: AppText.medium(
                    text: 'create_new_family_username',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              //TODO TEXT_FAILD
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 30.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(
                            text: 'new_family_username',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 12.h),
                      GetBuilder<CreateAccountController>(
                          builder: (controller) => TextFormField(
                                textInputAction: TextInputAction.go,
                                controller:
                                    controller.NewFamilyUserNamecontroller,
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
              //TODO BUTTON
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
