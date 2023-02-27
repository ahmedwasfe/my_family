import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';

class NotificationsScreen extends StatelessWidget {

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
            text: 'notifications',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Navigator.maybePop(context)),
      ),
      body:ListView.builder(
          scrollDirection: Axis.vertical,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
        return  Container(
          margin:
          const EdgeInsetsDirectional.only(start: 10, end: 10, top: 15),
          width: double.infinity,
          height: 140.h,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15).r,
              side: BorderSide(color: Colors.white, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO TEXT
                Container(
                  margin:
                  const EdgeInsetsDirectional.only(start: 10, top: 10),
                  alignment: AlignmentDirectional.topStart,
                  child: AppText.medium(
                      text: 'assignment 3',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                //TODO TEXT
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 10, top: 5),
                  alignment: AlignmentDirectional.topStart,
                  child: AppText.medium(
                      text: 'Maths',
                      color: AppColors.colorSubText,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                //TODO Row TEXT && IconButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                      const EdgeInsetsDirectional.only(start: 10, top: 5),
                      alignment: AlignmentDirectional.topStart,
                      child: AppText.medium(
                          text:
                          'Amet minim mollit non deserunt ullamco est sit alivelit...',
                          color: AppColors.colorSubText2,
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppHelper.getAppTheme(),
                            size: 20,
                          )),
                    ),
                  ],
                ),
                //TODO Row TEXT && IconButton
                Container(
                  margin: EdgeInsetsDirectional.only(start: 11, top: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppColors.colorSubText,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      AppText.medium(
                          text: '1 day and 16 hours ago',
                          color: AppColors.colorSubText,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }, itemCount: 30)
    );
  }
}
