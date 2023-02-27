import 'package:custom_check_box/custom_check_box.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/calendar_page_controller.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {

  final _controller = Get.put(CalendarPageController());

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
            text: 'calendar', color: Colors.white),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 450,
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: MonthViewSettings(showAgenda: true),
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 20),
                child: AppText.medium(text: 'Choose the child who has to do the Task', fontWeight: FontWeight.w400)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<CalendarPageController>(
                      builder: (controller) => Container(
                        width: 180.w,
                        height: 50.h,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Obx(() => AppText.medium(
                              text: controller
                                  .childSelected.value,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppHelper.getAppTheme(),
                            )),
                            items: controller.listChildren
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    '$item',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight:
                                      FontWeight.w500,
                                      color: AppHelper
                                          .getAppTheme(),
                                    ),
                                    overflow:
                                    TextOverflow.ellipsis,
                                  ),
                                ))
                                .toList(),
                            onChanged: (value) {
                              controller.childSelected.value =
                                  value.toString();
                              controller.update();
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 32,
                              color: Color(0xff000000),
                            ),
                            iconSize: 14.sp,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            buttonHeight: 50.h,
                            buttonWidth: 40.w,
                            buttonPadding: const EdgeInsets.only(
                                left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(26),
                                border: Border.all(
                                  color:
                                  AppColors.colorInputBorder,
                                  width: 0.5,
                                ),
                                color: Colors.white),
                            itemHeight: 50,
                            dropdownMaxHeight: 180,
                            dropdownWidth: 180,
                            dropdownDecoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            dropdownElevation: 8,
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(10, 0),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) => buildCalendarItem(index))
          ],
        ),
      ),
    );
  }

  Widget buildCalendarItem(int index) => Container(
    margin: EdgeInsetsDirectional.only(start: 12, end: 12, top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              AppText.medium(text: "10:00-13:00", color: AppColors.colorSubText1, fontWeight: FontWeight.w400),
              Spacer(),
              Icon(Icons.more_horiz_rounded, color: AppColors.colorSubText2,)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              AppText.medium(text: "1Design new UX flow for Michael", fontSize: 16, color: AppColors.colorMainText, fontWeight: FontWeight.w400),
              Spacer(),
              CustomCheckBox(
                value: true,
                checkedFillColor: AppHelper.getAppTheme(),
                splashColor: AppHelper.getAppTheme(),
                borderColor: Colors.white,
                tooltip: '',
                splashRadius: 9,
                onChanged: (val) {},
              ),
            ],
          ),
        ),
        Container(

            child: AppText.medium(text: 'Start from screen 16', fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.colorSubText1))
      ],
    ),
  );
}
