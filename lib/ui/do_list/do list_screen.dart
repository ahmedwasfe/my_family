import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/do_list_controller.dart';
import 'package:my_family/model/do_list/do_list.dart';
import 'package:my_family/ui/study/add_study_screen.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';


class ToDoListScreen extends GetView<ToDoList> {
  final _controller = Get.put(ToDoListController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'to_do_list', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                 Get.to(AddStudyScreen());
              })
        ],
      ),
      body:  ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.listToDoList.length,
          itemBuilder: (context, index) => buildStudy(context, _controller.listToDoList[index])),

    );
  }
  Widget buildStudy(BuildContext context, ToDoList toDoList) => GetBuilder<ToDoListController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: toDoList.isSelected ? AppHelper.getAppTheme() : Colors.white,
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
                radius: 40,
                backgroundImage: AssetImage( '${Const.images}${toDoList.image}'),
              ),
              SizedBox(width: 12.w),
              AppText.medium(text: '${toDoList.title}',  color: toDoList.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: (){
          for(ToDoList e in controller.listToDoList){
            e.isSelected = false;
          }
          toDoList.isSelected = true;
          controller.update();
          // Get.to(SublectsScreen());
        },
      ),
    ),
  ));
}
