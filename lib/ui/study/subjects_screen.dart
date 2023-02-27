import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_family/model/study/subjects.dart';
import 'package:my_family/utils/app_color.dart';

import '../../controller/study_controller.dart';
import '../../utils/app_helper.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
class SublectsScreen extends StatelessWidget {

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
            text: 'subjects', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Get.to(AddEntertainmentScreen());
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
              ),
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 16.r,top: 8.r,bottom: 8.r),
                child: Row(
                  children: [
                   const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 40,
                      backgroundImage: AssetImage('${Const.images}app_logo.png'),
                    ),
                    SizedBox(width: 12.w),
                AppText.medium(text: 'Khalil hothot'),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _controller.listSubjects.length,
                itemBuilder: (context, index) => buildsubjects(context, _controller.listSubjects[index])),
          ),

        ],
      ),
    );
  }
  Widget buildsubjects(BuildContext context, Subjects subjects) => GetBuilder<StudyController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: subjects.isSelected ? AppHelper.getAppTheme() : AppColors.lightGray7,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(

        child: Container(
          width: double.infinity,
          height: 40.h,
          alignment: AlignmentDirectional.center,
          margin:const EdgeInsetsDirectional.only(top: 8,bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              AppText.medium(text: '${subjects.title}', color: subjects.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: (){
          for(Subjects e in controller.listSubjects){
            e.isSelected = false;
          }
          subjects.isSelected = true;
          controller.update();
          Get.to(SublectsScreen());
        },
      ),
    ),
  ));
}
