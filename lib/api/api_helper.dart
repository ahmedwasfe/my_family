import 'package:my_family/utils/app_helper.dart';

class ApiHelper {
  static const String _baseUrl = 'https://my-family.tawaq3.com/api';

  static const String SPLASH = '$_baseUrl/splash';
  static const String LOGOUT = '$_baseUrl/logout';
  static const String LOGIN = '$_baseUrl/login';
  static const String REGISTER = '$_baseUrl/register';
  static const String HELPER_PERMISSIONS = '$_baseUrl/helper_permission';
  static const String ENTERTAINMENTS = '$_baseUrl/entertainments';
  static const String ADD_ENTERTAINMENTS = '$_baseUrl/add_entertainment';
  static const String GET_CHILDREN_BY_FAMILY = '$_baseUrl/children?family_id';
  static const String GET_FAMILY_MEMBERS = '$_baseUrl/family?family_id';

  static Map<String, String> langHeader({required String language}) {
    return {
      'Accept': 'application/json',
      'lang': language};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {
      'Accept': 'application/json',
      'Authorization': token};
  }

  static Map<String, String> allHeader(
      {required String token, required String language}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'lang': language
    };
  }

  static Map<String, String> headers() {
    return {'Accept': 'application/json',
      'X-Client-Device-Name': '${AppHelper.getDeviceName()}',};
  }
}
