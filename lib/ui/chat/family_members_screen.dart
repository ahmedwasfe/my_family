import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/chat_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class FamilyMembersScreen extends GetView<ChatController> {
  ChatController controller = Get.put(ChatController());

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
            text: 'family_members',
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
              //TODO TEXT_FAILD_SERACH
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 20.r, start: 24.r, end: 24.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ChatController>(
                          builder: (controller) => TextFormField(
                                textInputAction: TextInputAction.go,
                                controller: controller.SerachController,
                                keyboardType: TextInputType.text,
                                cursorColor: AppHelper.getAppTheme(),
                                cursorWidth: 1.3.w,
                                cursorRadius: const Radius.circular(10).r,
                                enabled: true,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'search'.tr,
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
                                  // suffixIcon: InkWell(
                                  //     child:SvgPicture.asset('${Const.icons}search.svg' ,height: 10,width: 10,),
                                  //     onTap: () {
                                  //       controller.SerachController.clear();
                                  //     })
                                ),

                                // validator: (username) => AppHelper.validatePassword(password: username!),
                              )),
                    ],
                  ),
                ),
              ),
              //TODO Parents
              Container(
                margin: const EdgeInsetsDirectional.only(start: 20, top: 16),
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(
                    text: 'parents', fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(
                height: 16.h,
              ),
              //TODO List_view Parents
              SizedBox(
                height: 220,
                child: Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: AlignmentDirectional.topStart,
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, top: 0),
                          width: double.infinity,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      '${Const.images}app_logo.png',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        start: 10, top: 10),
                                    alignment: AlignmentDirectional.topStart,
                                    child: AppText.medium(
                                        text: 'kevin.eth',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Divider(
                                endIndent: 20,
                                thickness: 1,
                                color: AppColors.colorInputBorder,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 20),
                ),
              ),
              //TODO Helpers
              Container(
                margin: const EdgeInsetsDirectional.only(start: 20, top: 30),
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(
                    text: 'helpers', fontWeight: FontWeight.w500, fontSize: 18),
              ),
              //TODO List_view Parents
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 220,
                child: Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: AlignmentDirectional.topStart,
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, top: 0),
                          width: double.infinity,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      '${Const.images}app_logo.png',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        start: 10, top: 10),
                                    alignment: AlignmentDirectional.topStart,
                                    child: AppText.medium(
                                        text: 'kevin.eth',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Divider(
                                endIndent: 20,
                                thickness: 1,
                                color: AppColors.colorInputBorder,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 20),
                ),
              ),


              //TODO children
              Container(
                margin: const EdgeInsetsDirectional.only(start: 20, top: 30),
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(
                    text: 'children', fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(
                height: 16.h,
              ),
              //TODO List_view Parents
              SizedBox(
                height: 220,
                child: Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: AlignmentDirectional.topStart,
                          margin: const EdgeInsetsDirectional.only(
                              start: 20, top: 0),
                          width: double.infinity,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      '${Const.images}app_logo.png',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        start: 10, top: 10),
                                    alignment: AlignmentDirectional.topStart,
                                    child: AppText.medium(
                                        text: 'kevin.eth',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Divider(
                                endIndent: 20,
                                thickness: 1,
                                color: AppColors.colorInputBorder,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
