import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/settings_controller.dart';
import 'package:my_family/model/language.dart';
import 'package:my_family/model/theme.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';
import 'package:my_family/utils/preferences_manager.dart';

class SettingsScreen extends StatelessWidget {

  final _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    print('APP THEME: ${PreferencesManager.getAppTheme(key: Const.KEY_THEME)}');
    print('APP THEME: ${AppHelper.getAppTheme()}');
    return GetBuilder<SettingsController>(builder: (controller) => Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'settings', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
        onTap: () => Get.offAndToNamed(Routes.home)),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsetsDirectional.all(16.r),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.r))
              ),
              child: Container(
                width: double.infinity,
                height: 80.h,
                margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 8),
                padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                color: AppColors.lightWhite,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('${Const.images}default_avatar.png'),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.medium(text: /*controller.getUserName()*/"User Name", fontWeight: FontWeight.w500, textAlign: TextAlign.start),
                        AppText.medium(text: /*controller.getUserEmail()*/"example@example.com",fontWeight: FontWeight.w400, color: AppColors.colorSubText, textAlign: TextAlign.start),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_user.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'edit_account',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () {
                  // Get.toNamed(Routes.profile);
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                        child: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            color: AppHelper.getAppTheme(),
                            '${Const.icons}icon_theme.svg')),
                  ),
                  SizedBox(
                      width: 20.w),
                  ExpandableTheme(
                      data: const ExpandableThemeData(useInkWell: true),
                      child: Container(child: buildExpandedThemes())),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r),
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppHelper.getAppTheme(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                        child: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            color: AppHelper.getAppTheme(),
                            '${Const.icons}icon_language.svg')),
                  ),
                  SizedBox(
                      width: 20.w),
                  ExpandableTheme(
                      data: const ExpandableThemeData(useInkWell: true),
                      child: Container(child: buildExpandedLanguage())),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r),
                    child: Row(
                      children: [
                        AppText.medium(text: AppHelper.getAppLanguage() == 'ar' ? 'arabic'.tr : 'english'.tr, color: AppHelper.getAppTheme()),
                        Icon(Icons.arrow_forward_ios, color: AppHelper.getAppTheme(), size: 20.r)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_about.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'about',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () {
                },
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_help.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'help',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () {
                },
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_logout.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'logout',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () => _controller.showLogoutBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildExpandedThemes() => ExpandableNotifier(
      child: Container(
        width: 250,
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: Container(
            width: 200,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                iconColor: AppColors.colorBackground,
                expandIcon: Icons.arrow_drop_up_sharp,
                collapseIcon: Icons.arrow_drop_down_sharp,
                iconSize: 30,
              ),
              header: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  child: AppText.medium(
                      text: 'themes',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _controller.listThemes.length,
                      itemBuilder: (context, index) => buildAppThemeItem(_controller.listThemes[index]),
                  separatorBuilder: (context, index) => Container(
                    width: 280,
                    height: 2.h,
                    color: Colors.grey,
                  )),
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
          ),
        ),
      ));

  Widget buildAppThemeItem(AppTheme theme) => Container(
    margin: EdgeInsetsDirectional.only(end: 10.r),
    child: GetBuilder<SettingsController>(builder: (controller) => Row(
      children: [
        Container(
          width: 200,
          alignment: AlignmentDirectional.topStart,
          child: RadioListTile<String>(
              activeColor: AppHelper.getAppTheme(),
              value: theme.name, groupValue: controller.themeSelected, onChanged: (value){
            for(AppTheme theme in controller.listThemes){
              theme.isSelected = false;
            }
            theme.isSelected = true;
            controller.themeSelected = value.toString();
            print('VALUE SELECTED: ${value.toString()}');
            print('THEME SELECTED: ${controller.themeSelected}');
            controller.saveTheme(theme.name);
            controller.update();

          }),
        ),
        const Spacer(),
        CircleAvatar(
          radius: 10.r,
          backgroundColor: Color(theme.hexColor),
        ),
      ],
    )),
  );

  Widget buildExpandedLanguage() => ExpandableNotifier(
      child: Container(
        width: 230,
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: Container(
            width: 200,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                iconColor: AppColors.colorBackground,
                expandIcon: Icons.arrow_drop_up_sharp,
                collapseIcon: Icons.arrow_drop_down_sharp,
                iconSize: 30,
              ),
              header: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  child: AppText.medium(
                      text: 'language',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _controller.listLanguages.length,
                      itemBuilder: (context, index) => buildLanguageItem(_controller.listLanguages[index]),
                      separatorBuilder: (context, index) => Container(
                        width: 280,
                        height: 2.h,
                        color: Colors.grey,
                      )),
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
          ),
        ),
      ));

  Widget buildLanguageItem(Language language) => Container(
    margin: EdgeInsetsDirectional.only(end: 10.r),
    child: GetBuilder<SettingsController>(builder: (controller) => Row(
      children: [
        Container(
          width: 150,
          alignment: AlignmentDirectional.topStart,
          child: RadioListTile<String>(
              activeColor: AppHelper.getAppTheme(),
              value: language.languageCode, groupValue: controller.languageSelected, onChanged: (value){
            for(Language language in controller.listLanguages){
              language.isSelected = false;
            }
            language.isSelected = true;
            controller.languageSelected = value.toString();
            print('VALUE SELECTED: ${value.toString()}');
            print('LANG SELECTED: ${controller.languageSelected}');
            controller.saveLanguage(language.languageCode);
            controller.update();

          }),
        ),
        Container(
            alignment: AlignmentDirectional.centerEnd,
            child: AppText.medium(
                text: language.language == 'arabic' ? 'arabic'.tr : 'english'.tr, textAlign: TextAlign.end)),
      ],
    )),
  );

}
