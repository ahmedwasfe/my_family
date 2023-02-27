import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/chat_controller.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class ChatPage extends StatelessWidget {

  final _controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'messages', color: Colors.white),
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
      body: GetBuilder<ChatController>(builder: (controller) => DefaultTabController(
        length: 2,
        initialIndex: controller.tabIndex,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
              width: 250,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50).r,
                  color: const Color(0xffF8F6FB)
              ),
              child: ButtonsTabBar(
                onTap: (index) {
                  controller.tabIndex = index;
                  controller.update();
                },
                physics: const NeverScrollableScrollPhysics(),
                buttonMargin: const EdgeInsets.only(left: 10, top: 4, bottom: 4, right: 10),
                radius: 50,
                backgroundColor: AppHelper.getAppTheme(),
                unselectedBackgroundColor: const Color(0xffF8F6FB),
                unselectedLabelStyle: TextStyle(color: HexColor(AppColors.appMainColor),fontSize: 16.h,fontWeight: FontWeight.w400),
                labelStyle:
                TextStyle(color: Colors.white,fontSize: 16.h,fontWeight: FontWeight.w400),
                tabs: [
                  Tab(
                    icon: Container(
                        margin: const EdgeInsets.all(4),
                        alignment: AlignmentDirectional.center,
                        width: 80.w,
                        height: 50 .h,
                        child: AppText.medium(text: 'messages', color: controller.tabIndex == 0 ? Colors.white : AppHelper.getAppTheme(), textAlign: TextAlign.center)),
                    text: "",
                  ),
                  Tab(
                    icon: Container(
                      width: 80.w,
                      height: 50 .h,
                      margin: const EdgeInsetsDirectional.only(end: 4, start: 4, top: 8),
                      child: AppText.medium(text: 'groups', color: controller.tabIndex == 1 ? Colors.white : AppHelper.getAppTheme(), textAlign: TextAlign.center),),
                    text: "",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 8.r, right: 8.r),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) => buildMessagesItem(),
                      separatorBuilder: (context, index) => Container(
                        margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
                        width: double.infinity,
                        height: 2,
                        color: AppColors.lightReviewsGray,
                      ))
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 8.r, right: 8.r),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) => buildGroupItem(),
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
                            width: double.infinity,
                            height: 2,
                            color: AppColors.lightReviewsGray,
                          ))
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildMessagesItem() => Container(
    margin: const EdgeInsetsDirectional.all(8),
    height: 80,
    color: Colors.white,
    child: Container(

      margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('${Const.images}default_avatar.png'),
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: AppColors.colorOnline,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.medium(text: 'kevin.eth', fontSize: 16, fontWeight: FontWeight.w600),

                    AppText.medium(text: '14:28', color: AppColors.colorSubText2, fontSize: 12, fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.medium(text: 'kevin.eth is typing...',color: AppColors.colorSubText2, fontSize: 16, fontWeight: FontWeight.w400),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppHelper.getAppTheme(),
                      child: AppText.medium(text: '8', color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget buildGroupItem() => Container(
    margin: const EdgeInsetsDirectional.all(8),
    height: 80,
    color: Colors.white,
    child: Container(

      margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('${Const.images}default_avatar.png'),
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: AppColors.colorOnline,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.medium(text: 'kevin.eth', fontSize: 16, fontWeight: FontWeight.w600),

                    AppText.medium(text: '14:28', color: AppColors.colorSubText2, fontSize: 12, fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.medium(text: 'kevin.eth is typing...',color: AppColors.colorSubText2, fontSize: 16, fontWeight: FontWeight.w400),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppHelper.getAppTheme(),
                      child: AppText.medium(text: '8', color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
