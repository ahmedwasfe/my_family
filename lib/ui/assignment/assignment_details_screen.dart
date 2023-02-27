import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';
class AssignmentDetailsScreen extends StatelessWidget {
  const AssignmentDetailsScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin:const EdgeInsetsDirectional.only(start: 24,top:28 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      '${Const.images}app_logo.png',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 14, top: 20),
                    alignment: AlignmentDirectional.topStart,
                    child: AppText.medium(
                        text: 'kevin.eth',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              margin:const EdgeInsetsDirectional.only(start: 24,top:16 ),
              child: AppText.larg(text: 'Mathematical model solution delivery'),
            ),

            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 14, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: AppText.medium(
                  text: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor \n do amet o duis enim velit Amet minim mollit non deserunt \n ullamco est sit aliqua dolor do amet o duis enim velit.',
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  fontSize: 12,
              color: AppColors.lightGray
              ),
            ),

            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 24, top: 24,end: 24),
              width: double.infinity,
              height:
              384,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('${Const.images}assigment.png',height: double.infinity,width: double.infinity,
              fit: BoxFit.contain,),
            ),

            Container(
              margin: EdgeInsetsDirectional.only(start:26.r ,end: 26.r,top: 9.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Image.asset('${Const.images}imag_check.png',
              width: 30.w,
              height: 30.h,),
                  AppText.medium(text: 'Submitted ',
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
                  Spacer(),
                  AppText.medium(text: '19 Seb',
                      fontSize: 12,
                      color: AppColors.lightBlue4,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
