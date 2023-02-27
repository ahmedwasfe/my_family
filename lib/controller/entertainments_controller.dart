import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/localDB/local_db.dart';
import 'package:my_family/localDB/model/save_entertainments.dart';
import 'package:my_family/model/entertainment/entertainment.dart';
import 'package:my_family/model/entertainment/suggestions/suggestions.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class EntertainmentsController extends GetxController {


  List<EntertainmentsData> listEntertainments = [
    EntertainmentsData(isSelected: true),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
    EntertainmentsData(isSelected: false),
  ];
  XFile? enterainmentImage;
  RxBool isLoading = false.obs;

  late TextEditingController titleEnterainmentsController;
  late TextEditingController enterainmentSuggeestionController;


  List<SaveEntertainments> listSuggestions = [];

  List<String> selectedSuggestions = [];

  @override
  void onInit() {
    titleEnterainmentsController = TextEditingController();
    enterainmentSuggeestionController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    titleEnterainmentsController.dispose();
    enterainmentSuggeestionController.dispose();
    super.dispose();
  }

  void requestStoragePermission() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("storage permission: ${statuses[Permission.storage]}");
      pickImageGallary(isCamera: false);
    }else {
      pickImageGallary(isCamera: false);
    }
  }

  void pickImageGallary({required bool isCamera}) async {
    final ImagePicker picker = ImagePicker();
    enterainmentImage = await picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    update();
  }


  bool verifySuggestionTitle() {
    if(enterainmentSuggeestionController.text.isEmpty){
      AppHelper.showSnackBar(title: 'suggestion', message: 'please_enter_suggestion');
      return false;
    }else {
      return true;
    }
  }

  bool verifyEntertainment(){
    if(titleEnterainmentsController.text.isEmpty){
      AppHelper.showSnackBar(title: 'entertainment', message: 'enter_entertainment');
      return false;
    }else if(enterainmentImage == null){
      AppHelper.showSnackBar(title: 'entertainment', message: 'select_image');
      return false;
    }else if(selectedSuggestions.isEmpty){
      AppHelper.showSnackBar(title: 'entertainment', message: 'choose_suggestion');
      return false;
    }else{
      return true;
    }
  }

  void addEntertainment() async {
    isLoading(true);
    if(verifyEntertainment()){
      await ApiRequestes.addEnterainment(language: AppHelper.getAppLanguage(),
          token: AppHelper.getCurrentUserToken()!,
          name: titleEnterainmentsController.text,
          image: enterainmentImage!.path,
          suggestionNo: selectedSuggestions.length.toString(),
          suggestions: selectedSuggestions)
          .then((value) {
            if(value != null){
              Get.offAndToNamed(Routes.entertainments);
              isLoading(false);
            }else {
              isLoading(false);
            }
      }, onError: (error) => isLoading(false))
      .catchError((error) => isLoading(false));
    }
  }

  Future saveEntertainmentsToLocalDB() async{
    if(verifySuggestionTitle()){
      final entertainment = SaveEntertainments(title: enterainmentSuggeestionController.text);
      await LocalDB.instance.saveEntertainments(entertainment)
          .then((value) {
        enterainmentSuggeestionController.clear();
        update();
      });
    }
  }

  Future getAllEntertainments() async {
    await  LocalDB.instance.readAllEntertainments()
        .then((value) {
      listSuggestions.clear();
      listSuggestions.addAll(value);
    });
  }

  Future deleteEntertainments({required int id}) async {
    await LocalDB.instance.deleteEntertainment(id)
        .then((value) {
          update();
    });
  }

  Future<void> getEntertainments() async {
    String testToken = 'Bearer 25|hUgCni6bv6qfmucA2P7EEzqH9GSYWmw1VdH2oFAy';
    await ApiRequestes.getEntertainments(token: AppHelper.getCurrentUserToken()!, language: AppHelper.getAppLanguage())
        .then((value) {
          if(value != null){
            listEntertainments.clear();
            listEntertainments.addAll(value.result!.entertainments!);
          }
    });
  }

  void showEntertainmentDialog(BuildContext context, EntertainmentsData entertainment) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            width: 400,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 10.r, bottom: 20.r),
                      child: AppText.medium(text: '${entertainment.name}')),
                  ListView.builder(
                    shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: entertainment.suggestions!.length,
                      itemBuilder: (context, index) => Container(
                    margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        LinearPercentIndicator(
                          animation: true,
                          lineHeight: 40,
                          animationDuration: 0,
                          percent: convertPercent(entertainment.suggestions![index].suggestionRate!),
                          barRadius: const Radius.circular(10),
                          isRTL: false,
                          center: AppText.medium(text: '${entertainment.suggestions![index].title}', fontSize: 14, fontWeight: FontWeight.w400),
                          progressColor: convertColor(entertainment.suggestions![index].suggestionRate!),
                          backgroundColor: AppColors.colorBack,
                        ),
                        Container(
                            margin: const EdgeInsetsDirectional.only(end: 10),
                            width: 50.w,
                            child: AppText.medium(text: '${entertainment.suggestions![index].suggestionRate}', color: const Color.fromRGBO(30, 178, 36, 40))),
                        Container(
                          margin: const EdgeInsetsDirectional.only(start: 16),
                          alignment: AlignmentDirectional.centerStart,
                          child: Card(
                            elevation: 16,
                            color: convertColor(entertainment.suggestions![index].suggestionRate!),
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
                  )),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 8.r, bottom: 8.r),
                    child: AppWidgets.CustomButton(
                        text: 'done'.tr,
                        width: 150,
                        height: 40,
                        radius: 50,
                        isUpperCase: false,
                        background: AppHelper.getAppTheme(),
                        borderColor: AppHelper.getAppTheme(),
                        click: () => Navigator.pop(context)),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  double convertPercent(String suggestionRate) {
    String test = '40%';
    if(suggestionRate.contains('%')){
      String rate = suggestionRate.replaceAll('%', '');
      if(rate == '100') {
        String r = '1.0';
        print('RATE: $r');
        return double.parse(r);
      } else {
        String r = '0.$rate';
        print('RATE: $r');
        return double.parse(r);
      }
    }
    return 0.0;
  }

  Color convertColor(String suggestionRate) {
    if(suggestionRate == '100%'){
      return AppColors.colorOneHundredPercent;
    }else if(suggestionRate == '90%'){
      return AppColors.colorNinetyPercent;
    }else if(suggestionRate == '80%'){
      return AppColors.colorEightyPercent;
    }else if(suggestionRate == '70%'){
      return AppColors.colorSeventyPercent;
    }else if(suggestionRate == '60%'){
      return AppColors.colorSixtyPercent;
    }else if(suggestionRate == '50%'){
      return AppColors.colorFiftyPercent;
    }else if(suggestionRate == '40%'){
      return AppColors.colorFourtyPercent;
    }else if(suggestionRate == '30%'){
      return AppColors.colorThirtyPercent;
    }else if(suggestionRate == '20%'){
      return AppColors.colorTwentyPercent;
    }else if(suggestionRate == '10%'){
      return AppColors.colorNinetyPercent;
    }else {
      return AppColors.colorBack;
    }
  }


}
