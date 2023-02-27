import 'package:get/get.dart';
import 'package:my_family/api/api_requestes.dart';
import 'package:my_family/model/family/family_members.dart';
import 'package:my_family/utils/app_helper.dart';

class FamilyController extends GetxController{

  FamilyData familyMembers = FamilyData();

  Future getFamilyMembers({required int familyId}) async {
    await ApiRequestes.getFamilyMembers(
        token: AppHelper.getCurrentUserToken()!,
        language: AppHelper.getAppLanguage(), familyId: familyId)
        .then((value) {
          if(value != null){
            familyMembers = value.result!.family!;
          }
    });
  }
}