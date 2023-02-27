import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/entertainments_controller.dart';
import 'package:my_family/model/entertainment/entertainment.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/ui/entertainment/add_entertainment_screen.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';

class EntertainmentsScreen extends StatelessWidget {

  final _controller = Get.put(EntertainmentsController());

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
            text: 'entertainment', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.toNamed(Routes.addEntertainments);
              })
        ],
      ),
      body: FutureBuilder(
        // future: _controller.getEntertainments(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listEntertainments.isNotEmpty){
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.listEntertainments.length,
                  itemBuilder: (context, index) => buildEntertainment(context, _controller.listEntertainments[index]));
            }else {
              return AppWidgets.CustomNoDataFound();
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _controller.listEntertainments.length,
                itemBuilder: (context, index) => buildEntertainmentTest(context, _controller.listEntertainments[index]));
            // return Container();
          }
        },
      ),
    );
  }

  Widget buildEntertainment(BuildContext context, EntertainmentsData entertainment) => GetBuilder<EntertainmentsController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: entertainment.isSelected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 70.h,
              width: 90.w,
              margin: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Image.network(
                  '${entertainment.imageUrl}', fit: BoxFit.cover,),
            ),
            SizedBox(width: 12.w),
            AppText.medium(text: '${entertainment.name}', color: entertainment.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
          ],
        ),
        onTap: (){
          for(EntertainmentsData e in controller.listEntertainments){
            e.isSelected = false;
          }
          entertainment.isSelected = true;
          controller.update();

          controller.showEntertainmentDialog(context, entertainment);
        },
      ),
    ),
  ));

  Widget buildEntertainmentTest(BuildContext context, EntertainmentsData entertainment) => GetBuilder<EntertainmentsController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: entertainment.isSelected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 70.h,
              width: 90.w,
              margin: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Image.asset(
                '${Const.images}def_image.png', fit: BoxFit.cover,),
            ),
            SizedBox(width: 12.w),
            AppText.medium(text: "Entertainment Name", color: entertainment.isSelected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
          ],
        ),
        onTap: (){
          for(EntertainmentsData e in controller.listEntertainments){
            e.isSelected = false;
          }
          entertainment.isSelected = true;
          controller.update();

          // controller.showEntertainmentDialog(context, entertainment);
        },
      ),
    ),
  ));
}
