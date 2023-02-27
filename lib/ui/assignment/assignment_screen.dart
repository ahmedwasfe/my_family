import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/assignment_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class AssignmentScreen extends GetView<AssignmentController> {
 AssignmentController controller=Get.put(AssignmentController());

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
            text: 'assignment',
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
      body: Form(
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
                    GetBuilder<AssignmentController>(
                        builder: (controller) => TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: controller.SearchController,
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
                           prefixIcon:const Icon(Icons.search_rounded,color: AppColors.colorSubText,),
                           hintText: 'search_assignment'.tr,
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

            //TODO comment list tody



            //TODO List assigment
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 30,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                return Container(
                  margin:const EdgeInsetsDirectional.only(start: 16,end: 16,top: 20),
                  width: double.infinity,
                  height: 130.h,
                  child:Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25).r
                    ),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 12,end: 12,top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(text: 'assignment 1',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),

                              AppText.medium(text: '19 Seb',
                                  fontSize: 12,
                                  color: AppColors.lightBlue4,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                        ),

                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 14,top: 6),
                          child: AppText.medium(text: 'maths',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorSubText),
                        ),

                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 14,top: 6),
                          child: AppText.medium(text: 'Amet minim mollit non deserunt ullamco est sit aliqua \n dolor do amet o duis enim velit...',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorSubText),
                        ),
                        Container(
                          margin:const EdgeInsetsDirectional.only(start: 12,end: 12,top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(text: '4 days left',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorRed),

                              AppText.medium(text: 'Readmore',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightRed),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )



          ],
        ),
      ),
    );
  }
}
