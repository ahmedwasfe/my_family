import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/home_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/constants.dart';

class HomeScreen extends StatelessWidget {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    print('TYPE: ${AppHelper.getUserType()}');
    print('TOKEN: ${AppHelper.getCurrentUserToken()}');
    if(AppHelper.getUserType() == Const.KEY_FAMILY) {
      print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentParentUser())}');
    } else if(AppHelper.getUserType() == Const.KEY_HELPER) {
      print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentOtherUser())}');
    } else if(AppHelper.getUserType() == Const.KEY_CHILD) {
      print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentOtherUser())}');
    }

    AppHelper.statusBarColor(isHome: true);
    return GetBuilder<HomeController>(builder: (controller) => Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: controller.listScreens[controller.navIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r, bottom: 20.r),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AppHelper.getAppTheme(),
            borderRadius: BorderRadius.circular(14.r)),
        child: BottomNavigationBar(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppHelper.getAppTheme(),
          currentIndex: controller.navIndex,
          items: _bottomNavigationBarItems(),
          onTap: (navIndex) => controller.getCurrenNavIndex(navIndex: navIndex),
        ),
      ),
    ));
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_home.svg', color: AppHelper.getAppTheme()),
        icon: SvgPicture.asset('${Const.icons}icon_home.svg'), label: 'home'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_calendar.svg', color: AppHelper.getAppTheme()),
        icon: SvgPicture.asset('${Const.icons}icon_calendar.svg'), label: 'calendar'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_messages.svg', color: AppHelper.getAppTheme()),
        icon: SvgPicture.asset('${Const.icons}icon_messages.svg'), label: 'messages'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_family.svg', color: AppHelper.getAppTheme()),
        icon: SvgPicture.asset('${Const.icons}icon_family.svg'), label: 'family'.tr),
  ];
}
