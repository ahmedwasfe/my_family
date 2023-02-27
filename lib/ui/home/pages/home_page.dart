import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/home_page_controller.dart';
import 'package:my_family/model/home_type.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class HomePage extends StatelessWidget {

  final _controller = Get.put(HomePageController());

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
            text: 'home', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: Container(),
        actions: [
          Container(
            margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
            child: InkWell(
                child: SvgPicture.asset('${Const.icons}icon_notification_home.svg', height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
                onTap: () => Get.toNamed(Routes.notifications)),
          )
        ],
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: _controller.listHomeType.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 14,
            childAspectRatio: 100 / 95,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => buildHomeTypeItem(index, _controller.listHomeType[index])),
    );
  }

  Widget buildHomeTypeItem(int index, HomeType type) => Container(
    margin: const EdgeInsets.all(20),
    child: InkWell(
      child: GetBuilder<HomePageController>(builder: (controller) => Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        color: type.isSelected ? AppHelper.getAppTheme() : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('${Const.images}${type.image}', fit: BoxFit.scaleDown),
            SizedBox(height: 8.h),
            AppText.medium(text: type.title, color: type.isSelected ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.w500)
          ],
        ),
      )),
      onTap: () {
        for(HomeType type in _controller.listHomeType){
          type.isSelected = false;
        }
        type.isSelected = true;
        _controller.update();

        if(index == 0){
          Get.toNamed(Routes.entertainments);
        }else if(index == 1){
          Get.toNamed(Routes.study);
        }else if(index == 2) {
          Get.toNamed(Routes.toDoList);
        }
      },
    ),
  );
}
