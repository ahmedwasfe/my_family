import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/chat_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class CreateGroupScreen extends GetView<ChatController> {
  final _controller = Get.put(ChatController());

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
            text: 'create_group',
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
          // key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TODO Image
              Container(
                margin:const EdgeInsetsDirectional.only(top: 35),
                width: double.infinity,
                height: 100.h,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset('${Const.images}create_group.png',
                      height: 150.h,
                      width: 150.w,),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        margin:const EdgeInsetsDirectional.only(end: 78),
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // TODO Group Name
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 38.r, start: 15.r, end: 15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ChatController>(
                        builder: (controller)=> TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: controller.GroupNameController,
                          keyboardType: TextInputType.text,
                          cursorColor: AppHelper.getAppTheme(),
                          cursorWidth: 1.3.w,
                          cursorRadius:const Radius.circular(10).r,
                          enabled: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'group_name'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400
                              ),
                              fillColor: Color(0xffFAFAFA),
                              filled: true,
                              helperMaxLines: 2,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.lightReviewsGray , width: 1.w),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              constraints: BoxConstraints(
                                maxHeight: 50.h,
                                minWidth: 48.w,
                              )),
                          // validator: (familyName) => AppHelper.validateFamilyName(familyName: familyName!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TODO Description
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r, start: 15.r, end: 15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ChatController>(
                        builder: (controller)=> TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: controller.DescriptionController,
                          keyboardType: TextInputType.text,
                          cursorColor: AppHelper.getAppTheme(),
                          cursorWidth: 1.3.w,
                          cursorRadius:const Radius.circular(10).r,
                          enabled: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'description'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400
                              ),
                              fillColor: Color(0xffFAFAFA),
                              filled: true,
                              helperMaxLines: 2,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.lightReviewsGray , width: 1.w),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              constraints: BoxConstraints(
                                maxHeight: 50.h,
                                minWidth: 48.w,
                              )),
                          // validator: (familyName) => AppHelper.validateFamilyName(familyName: familyName!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TODO Text More
              Container(
                margin:const EdgeInsetsDirectional.only(start: 15,top: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'participants',fontWeight: FontWeight.w400,
                    fontSize: 14),
                  const  SizedBox(width: 5,),
                    AppText.medium(text: '5',fontWeight: FontWeight.w400,
                        fontSize: 14),
                    const     SizedBox(width: 5,),
                    AppText.medium(text: 'of',fontWeight: FontWeight.w400,
                        fontSize: 14),
                    const    SizedBox(width: 5,),
                    AppText.medium(text: '7',fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ],
                ),
              ),
              SizedBox(height: 21.h,),
              //TODO List User
              SizedBox(
                width: double.infinity,
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                  return  Container(
                    alignment: AlignmentDirectional.center,
                    width: 100.w,
                    height: 200.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 35,
                              backgroundImage: AssetImage('${Const.images}user_group.png'),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  margin:const EdgeInsetsDirectional.only(end: 65,bottom: 45),
                                  width: 28.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15).r,
                                  ),
                                  child:const Icon(Icons.cancel_outlined,color: AppColors.colorAppMain, )
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin:const EdgeInsetsDirectional.only(top: 5),
                          alignment: AlignmentDirectional.center,
                          child: AppText.medium(text: 'Kevin',fontSize: 14,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
