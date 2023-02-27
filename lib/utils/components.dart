import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class AppWidgets {

  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = double.infinity,
    double height = 48.0,
    Color background = AppColors.colorAppMain,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w700,
    double radius = 14.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.colorAppMain,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: click,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );

  static Widget CustomAppProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
              color: AppHelper.getAppTheme())));

  static Widget CustomAnimationProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 40.w,
          height: 40.h,
          child: LoadingAnimationWidget.fourRotatingDots(
              color: AppHelper.getAppTheme(),
              size: 25.h)));

  static Widget CustomNoDataFound() => Center(
    child: SizedBox(
      width: 280,
      height: 350,
      child: Column(
        children: [
          Image.asset('${Const.images}no_data.png'),
          AppText.medium(text: 'no_data', fontSize: 18, fontWeight: FontWeight.w600)
        ],
      ),
    ),
  );
}
/*
Widget PageViewScreens(FirstPagesData boarding, int index) {
  print('BOARDING: ${boarding.image}');
  return Container(
   child: Stack(
     alignment: Alignment.topCenter,
     children: [
       Container(
         width: double.infinity,
         height: double.infinity,
         child: Image.network('${boarding.image}',
             fit: BoxFit.cover),
       ),
       Padding(
         padding: const EdgeInsets.only(top: 280.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               alignment: Alignment.center,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CircleAvatar(
                     backgroundColor: index == 0
                         ? HexColor(AppColors.appMainColor)
                         : HexColor(AppColors.appSubColor),
                     child: AppText.medium(text: '1', color: Colors.white),
                   ),
                   Container(
                     height: 4.r,
                     width: 20.w,
                     margin: EdgeInsets.symmetric(horizontal: 8.r),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20.r)),
                   ),
                   CircleAvatar(
                     backgroundColor: index == 1
                         ? HexColor(AppColors.appMainColor)
                         : HexColor(AppColors.appSubColor),
                     child: AppText.medium(text: '2', color: Colors.white),
                   ),
                   Container(
                     height: 4.r,
                     width: 20.w,
                     margin: EdgeInsets.symmetric(horizontal: 8.r),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20.r)),
                   ),
                   CircleAvatar(
                     backgroundColor: index == 2
                         ? HexColor(AppColors.appMainColor)
                         : HexColor(AppColors.appSubColor),
                     child: AppText.medium(text: '3', color: Colors.white),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 16.h),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 8.r),
               child: AppText.medium(
                   text: boarding.title!,
                   fontSize: Platform.isAndroid ? 20.sp : 18.sp,
                   color: Colors.white,
                   maxline: 2,
                   height: 1.2,
                   fontWeight: FontWeight.w500,
                   textAlign: TextAlign.center),
             ),
           ],
         ),
       ),
       Container(
         width: double.infinity,
         height: double.infinity,
         color: Colors.black38,
       ),
     ],
   ),
 );
}

Widget PageViewScreensLocal(FirstPagesData boarding, int index) {
 print('BOARDING: ${Const.images}boarding${index+1}.png');
  return Container(
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('${Const.images}boarding${index+1}.png',
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: index == 0
                          ? HexColor(AppColors.appMainColor)
                          : HexColor(AppColors.appSubColor),
                      child: AppText.medium(text: '1', color: Colors.white),
                    ),
                    Container(
                      height: 4.r,
                      width: 20.w,
                      margin: EdgeInsets.symmetric(horizontal: 8.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    CircleAvatar(
                      backgroundColor: index == 1
                          ? HexColor(AppColors.appMainColor)
                          : HexColor(AppColors.appSubColor),
                      child: AppText.medium(text: '2', color: Colors.white),
                    ),
                    Container(
                      height: 4.r,
                      width: 20.w,
                      margin: EdgeInsets.symmetric(horizontal: 8.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    CircleAvatar(
                      backgroundColor: index == 2
                          ? HexColor(AppColors.appMainColor)
                          : HexColor(AppColors.appSubColor),
                      child: AppText.medium(text: '3', color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.r),
                child: AppText.medium(
                    text: boarding.title!,
                    fontSize: Platform.isAndroid ? 20.sp : 18.sp,
                    color: Colors.white,
                    maxline: 2,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black38,
        ),
      ],
    ),
  );
}*/

class MainToolBar extends StatelessWidget {
  String? title;
  String? route = '';
  bool? isBack = false;

  MainToolBar({required this.title, this.route, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            SizedBox(width: 20),
            isBack!
                ? InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () => Get.offAndToNamed(route!))
                : Container(),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                '$title'.tr,
                style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: Const.appFont),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
