import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/family_controller.dart';
import 'package:my_family/model/family/family_members.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class FamilyPage extends StatelessWidget {

  final _controller = Get.put(FamilyController());

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
            text: 'family', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(Routes.settings)),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 8, end: 8),
            child: InkWell(
                child: SvgPicture.asset('${Const.icons}icon_notification_home.svg', height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
                onTap: () => Get.toNamed(Routes.notifications)),
          )
        ],
      ),
      body: FutureBuilder(
        // future: _controller.getFamilyMembers(familyId: AppHelper.getFamilyId()),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(10),
                        topStart: Radius.circular(10),
                      )
                    ),
                    child: buildExpandedFamilyMembers(_controller.familyMembers)),
                ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Align(
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 20.r),
                        width: 350.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: AppHelper.getAppTheme(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 11),
                          child: ExpandableTheme(
                              data: const ExpandableThemeData(useInkWell: true),
                              child: Container(child: buildExpandedFamilyMembers(_controller.familyMembers))),
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildExpandedFamilyMembers(FamilyData family) => ExpandableNotifier(
      child: Container(
        color: AppHelper.getAppTheme(),
        width: double.infinity,
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: Container(
            width: 200,
            color: AppHelper.getAppTheme(),
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                iconColor: Colors.white,
                expandIcon: Icons.arrow_drop_up_sharp,
                collapseIcon: Icons.arrow_drop_down_sharp,
                iconSize: 30,
              ),
              header: Container(
                margin: EdgeInsetsDirectional.only(bottom: 10.r, start: 20.r),
                decoration: BoxDecoration(
                    color: AppHelper.getAppTheme(),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  child: AppText.medium(
                    text: 'Parents',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                color: Colors.white,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return buildFamilyMembers();
                    }),
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

  Widget buildFamilyMembers() => Container(
    width: double.infinity,
    height: 70.h,
    margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 8),
    padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
    color: AppColors.lightWhite,
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('${Const.images}default_avatar.png'),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.medium(text: 'Member Name', fontWeight: FontWeight.w500),
            AppText.medium(text: 'example@example.com',fontWeight: FontWeight.w400, color: AppColors.colorSubText),
          ],
        ),
        Spacer(),
        Icon(Icons.location_on, color: AppColors.colorSubText),
      ],
    ),
  );
}
