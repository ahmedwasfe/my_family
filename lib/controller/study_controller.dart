

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/model/auth/helper_selected.dart';
import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/study/subjects.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../model/entertainment/entertainment.dart';
import '../model/study/study.dart';
import '../utils/app_helper.dart';
import '../utils/app_text.dart';
import '../utils/components.dart';
import '../utils/constants.dart';

class StudyController extends GetxController {


  late GlobalKey<FormState> formKey;
  late TextEditingController TitleOneController;
  late TextEditingController TitleTwoController;
  late TextEditingController TitleThreeController;
  late TextEditingController TitleFourController;
  late TextEditingController TitleFiveController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    TitleOneController = TextEditingController();
    TitleTwoController = TextEditingController();
    TitleThreeController = TextEditingController();
    TitleFourController = TextEditingController();
    TitleFiveController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    TitleOneController.dispose();
    TitleTwoController.dispose();
    TitleThreeController.dispose();
    TitleFourController.dispose();
    TitleFiveController.dispose();
    super.dispose();
  }



  RxString helperSelected = '1'.obs;
  RxString AssignmentSelected = 'name_child'.obs;

  List<ChildData> listChildren = [
    ChildData(isSelected: true),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
    ChildData(isSelected: false),
  ];
  List<Subjects> listSubjects = [
  Subjects(
    title: 'Chemistry',
    isSelected: true,
  ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
    Subjects(
      title: 'Chemistry',
      isSelected: true,
    ),
  ];



  List<String> listHelpersCount = [
    '1',
    '2',
    '3',
    '4',
  ];
  List<String> listAssignmentCount = [
    'Khalil',
    'Ahmed',
    'Ali',
    'Ahmed',
  ];



  Future<void> getChildren() async {
    await ApiRequestes.getChildrenByFamily(familyId: AppHelper.getFamilyId(), token: AppHelper.getCurrentUserToken()!, language: AppHelper.getAppLanguage())
        .then((value) {
          if(value != null){
            listChildren.clear();
            listChildren.addAll(value.result!.children!);
          }
    });
  }


  void showEntertainmentDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            width: 400,
            height: 350.h,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsetsDirectional.only(top: 10.r, bottom: 20.r),
                    child: AppText.medium(text: 'Title of Etertainment')),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 40,
                        animationDuration: 0,
                        percent: 0.7,
                        barRadius: const Radius.circular(10),
                        isRTL: false,
                        center: AppText.medium(text: 'Suggestion list item', fontSize: 14, fontWeight: FontWeight.w400),
                        progressColor: HexColor('A5E0A7'),
                        backgroundColor: HexColor('F3F3F3'),
                      ),
                      Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          width: 50.w,
                          child: AppText.medium(text: '70%', color: const Color.fromRGBO(30, 178, 36, 40))),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 16),
                        alignment: AlignmentDirectional.centerStart,
                        child: Card(
                          elevation: 16,
                          color: HexColor('A5E0A7'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Container(
                            width: 24,
                            height: 24,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 40,
                        animationDuration: 0,
                        percent: 0.2,
                        barRadius: const Radius.circular(10),
                        isRTL: false,
                        center: AppText.medium(text: 'Suggestion list item', fontSize: 14, fontWeight: FontWeight.w400),
                        progressColor: HexColor('99D5FF'),
                        backgroundColor: HexColor('F3F3F3'),
                      ),
                      Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          width: 50.w,
                          child: AppText.medium(text: '20%', color: const Color.fromRGBO(0, 149, 255, 40))),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 16),
                        alignment: AlignmentDirectional.centerStart,
                        child: Card(
                          elevation: 16,
                          color: HexColor('99D5FF'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Container(
                            width: 24,
                            height: 24,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 40,
                        animationDuration: 0,
                        percent: 0.6,
                        barRadius: const Radius.circular(10),
                        isRTL: false,
                        center: AppText.medium(text: 'Suggestion list item', fontSize: 14, fontWeight: FontWeight.w400),
                        progressColor: HexColor('FFC7CD'),
                        backgroundColor: HexColor('F3F3F3'),
                      ),
                      Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          width: 50.w,
                          child: AppText.medium(text: '60%', color: const Color.fromRGBO(255, 199, 205, 100))),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 16),
                        alignment: AlignmentDirectional.centerStart,
                        child: Card(
                          elevation: 16,
                          color: HexColor('FFC7CD'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Container(
                            width: 24,
                            height: 24,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 40,
                        animationDuration: 0,
                        percent: 0.5,
                        barRadius: const Radius.circular(10),
                        isRTL: false,
                        center: AppText.medium(text: 'Suggestion list item', fontSize: 14, fontWeight: FontWeight.w400),
                        progressColor: HexColor('965DF8'),
                        backgroundColor: HexColor('F3F3F3'),
                      ),
                      Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          width: 50.w,
                          child: AppText.medium(text: '50%', color: HexColor('965DF8'))),
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 16),
                        alignment: AlignmentDirectional.centerStart,
                        child: Card(
                          elevation: 16,
                          color: HexColor('965DF8'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Container(
                            width: 24,
                            height: 24,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                  child: AppWidgets.CustomButton(
                      text: 'Done',
                      width: 150,
                      height: 40,
                      radius: 50,
                      background: AppHelper.getAppTheme(),
                      borderColor: AppHelper.getAppTheme(),
                      click: (){}),
                )
              ],
            ),
          ),
        ));
  }
}