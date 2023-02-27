import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_family/controller/study_controller.dart';
import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/study/study.dart';
import 'package:my_family/ui/study/subjects_screen.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';

class StudyScreen extends StatelessWidget{

  final _controller = Get.put(StudyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'study', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),

      ),
      body: FutureBuilder(
        // future: _controller.getChildren(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listChildren.isNotEmpty){
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.listChildren.length,
                  itemBuilder: (context, index) => buildStudy(context, _controller.listChildren[index]));
            }else{
              return AppWidgets.CustomNoDataFound();
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else{
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _controller.listChildren.length,
                itemBuilder: (context, index) => buildStudyTest(context, _controller.listChildren[index]));
          }
        },
      ),
    );
  }
  Widget buildStudy(BuildContext context, ChildData child) => GetBuilder<StudyController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: child.isSelected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(

        child: Container(
          margin:const EdgeInsetsDirectional.only(top: 8,bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30,
                backgroundImage: NetworkImage( '${child.imageUrl}'),
              ),
              SizedBox(width: 12.w),
              AppText.medium(text: child.name == null ? child.family!.familyName! : child.name!,  color: child.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: () {
          for(ChildData child in controller.listChildren){
            child.isSelected = false;
          }
          child.isSelected = true;
          controller.update();
          // Get.to(SublectsScreen());
        },
      ),
    ),
  ));

  Widget buildStudyTest(BuildContext context, ChildData child) => GetBuilder<StudyController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: child.isSelected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(

        child: Container(
          margin:const EdgeInsetsDirectional.only(top: 8,bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30,
                backgroundImage: AssetImage( '${Const.images}def_image.png'),
              ),
              SizedBox(width: 12.w),
              AppText.medium(text: "Child Name",  color: child.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: () {
          for(ChildData child in controller.listChildren){
            child.isSelected = false;
          }
          child.isSelected = true;
          controller.update();
          // Get.to(SublectsScreen());
        },
      ),
    ),
  ));
}
