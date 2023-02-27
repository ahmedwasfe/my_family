import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:my_family/api/api_helper.dart';
import 'package:my_family/model/auth/other_auth.dart';
import 'package:my_family/model/auth/parent_auth.dart';
import 'package:my_family/model/auth/child_selected.dart';
import 'package:my_family/model/auth/helper_selected.dart';
import 'package:my_family/model/auth/logout.dart';
import 'package:my_family/model/children/children.dart';
import 'package:my_family/model/entertainment/add_enterainment.dart';
import 'package:my_family/model/entertainment/entertainment.dart';
import 'package:my_family/model/family/family_members.dart';
import 'package:my_family/model/helper/helper_permissions.dart';
import 'package:my_family/model/splash.dart';
import 'package:my_family/utils/constants.dart';

class ApiRequestes {
  static final _client = http.Client();

  static Future<Splash?> getSplash({required String language}) async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.SPLASH),
        headers: ApiHelper.langHeader(language: language));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Splash splash = Splash.fromJson(body);
      // print('SUCCESS getSplashL ${jsonEncode(splash)}');
      return splash;
    } else if (response.statusCode == 404) {
      var body = jsonDecode(response.body);
      Splash error = Splash.fromJson(body);
      print('ERROE getSplashL ${jsonEncode(error)}');
      return error;
    } else {
      print('ERROE getSplash: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Logout?> logout({required String token}) async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
        headers: ApiHelper.tokenHeader(token: token));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Logout logout = Logout.fromJson(body);
      // print('SUCCESS: ${jsonEncode(logout)}');
      return logout;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ParentAuth?> login({
    required String familyName,
    required String email,
    required String password,
  }) async {
    print('FAMILY NAME: $familyName');
    print('EMAIL: $email');
    print('PASSWORD: $password');

    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
        headers: ApiHelper.headers(),
        body: <String, dynamic>{
          'family_name': familyName,
          'email': email,
          'password': password
        },
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ParentAuth login = ParentAuth.fromJson(body);
      // print('SUCCESS: ${jsonEncode(login)}');
      return login;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<OtherAuth?> loginOtherUser({
    required String familyName,
    required String email,
    required String password,
  }) async {
    print('FAMILY NAME: $familyName');
    print('EMAIL: $email');
    print('PASSWORD: $password');

    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
        headers: ApiHelper.headers(),
        body: <String, dynamic>{
          'family_name': familyName,
          'email': email,
          'password': password
        },
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      OtherAuth login = OtherAuth.fromJson(body);
      // print('SUCCESS: ${jsonEncode(login)}');
      return login;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

   static Future<ParentAuth?> createAccount(
      {required String language,
        required String parentName,
        required String parentEmail,
        required String otherParentName,
        required String otherParentEmail,
        required String password,
        required String familName,
        required String familyPassword,
        required String helpersNo,
        required String childrenNo,
      required List<HelperSelected> helpers,
      required List<ChildSelected> children}) async {

    print('PARENT NAME: $parentName');
    print('PARENT EMAIL: $parentEmail');
    print('OTHER PARENT NAME: $otherParentName');
    print('OTHER PARENT EMAIL: $otherParentEmail');
    print('PASSWORD: $password');
    print('FAMILY NAME: $familName');
    print('FAMILY PASSWORD: $familyPassword');
    print('HELPERS NUMBER: $helpersNo');
    print('CHILDREN NUMBER: $childrenNo');
    print('HELPERS: ${jsonEncode(helpers)}');
    print('CHILDREN: ${jsonEncode(children)}');

    var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.REGISTER));
    request.headers.addAll(ApiHelper.headers());
    request.fields['parent_name'] = parentName;
    request.fields['parent_email'] = parentEmail;
    request.fields['other_parent_email'] = otherParentEmail;
    request.fields['other_parent_name'] = otherParentName;
    request.fields['password'] = password;
    request.fields['family_name'] = familName;
    request.fields['family_password'] = familyPassword;
    request.fields['helpers_no'] = helpersNo;
    request.fields['children_no'] = childrenNo;


    // TODO 'helper_permission[0][email]': 'ahmed.te@mail.com',
    // TODO 'helper_permission[0][permission][0]': '1',
    for (var i = 0; i < helpers.length; i++) {
      print('EMAILS LIST: ${jsonEncode(helpers[i].email!)}');
      request.fields['helper_permission[$i][email]'] = helpers[i].email!;
      List<int> permissions = (jsonDecode(helpers[i].permission!) as List<dynamic>).cast<int>();
      // print('PERMISSIONS LIST: ${jsonEncode(permissions)}');
      for (var x = 0; x < permissions.length; x++) {
        print('PERMISSIONS LIST: ${jsonEncode(permissions[x])}');
        request.fields['helper_permission[$i][permission][$x]'] = permissions[x].toString();
      }
    }

    // TODO children[0]
    for (var i = 0; i < children.length; i++) {
      print('CHILDREN LIST: ${jsonEncode(children[i].email)}');
      request.fields['children[$i]'] = children[i].email!;
    }

    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var body = jsonDecode(responseBody.body);
      ParentAuth register = ParentAuth.fromJson(body);
      print('SUUCESS: ${jsonEncode(register)}');
      return register;
    } else {
      print('ERROR: ${jsonDecode(responseBody.body)}');
      return null;
    }
  }

  static Future<HelperPermissions?> getHelperPermissions(
      {required String language}) async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.HELPER_PERMISSIONS),
        headers: ApiHelper.langHeader(language: language));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      HelperPermissions permissions = HelperPermissions.fromJson(body);
      // print('SUCCESS: ${jsonEncode(permissions)}');
      return permissions;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Entertainments?> getEntertainments({required String token, required String language}) async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.ENTERTAINMENTS),
    headers: ApiHelper.allHeader(token: token, language: language));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Entertainments entertainments = Entertainments.fromJson(body);
      // print('SUCCESS: ${jsonEncode(entertainments)}');
      return entertainments;
    }else{
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AddEnterainment?> addEnterainment({
    required String language,
    required String token,
  required String name,
  required String image,
  required String suggestionNo,
  required List<String> suggestions}) async {

    print('NAME: $name');
    print('IMAGE: $image');
    print('NUMBER: $suggestionNo');
    print('suggestions: ${jsonEncode(suggestions)}');

    var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.ADD_ENTERTAINMENTS));
    request.headers.addAll(ApiHelper.allHeader(token: token, language: language));
    request.files.add(await http.MultipartFile.fromPath('image', image, filename: image.split('/').last));
    request.fields['name'] = name;
    request.fields['suggestion_no'] = suggestionNo;
    if(suggestions.isNotEmpty){
      for(var i = 0; i < suggestions.length; i++){
        request.fields['suggestion[$i]'] = suggestions[i];
      }
    }

    var response = await request.send();
    var bodyResponse = await http.Response.fromStream(response);

    if(bodyResponse.statusCode == 200){
      var body = jsonDecode(bodyResponse.body);
      AddEnterainment enterainment = AddEnterainment.fromJson(body);
      print('SUCCESS: ${jsonEncode(enterainment)}');
      return enterainment;
    }else {
      print('ERROR: ${jsonDecode(bodyResponse.body)}');
      return null;
    }
  }

  static Future<Children?> getChildrenByFamily({
    required int familyId,
  required String token, required String language
}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.GET_CHILDREN_BY_FAMILY}=$familyId'),
    headers: ApiHelper.allHeader(token: token, language: language));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Children children = Children.fromJson(body);
      // print('SUCCESS: ${jsonEncode(children)}');
      return children;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<FamilyMembers?> getFamilyMembers({
  required String token, required String language, required int familyId
}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.GET_FAMILY_MEMBERS}=$familyId'),
    headers: ApiHelper.allHeader(token: token, language: language));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      FamilyMembers members = FamilyMembers.fromJson(body);
      print('SUCCESS: ${jsonEncode(members)}');
      return members;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }
}
