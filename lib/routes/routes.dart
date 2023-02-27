
import 'package:get/get.dart';
import 'package:my_family/bindings/login_bindings.dart';
import 'package:my_family/bindings/create_account_bindings.dart';
import 'package:my_family/model/do_list/do_list.dart';
import 'package:my_family/ui/assignment/assignment_details_screen.dart';
import 'package:my_family/ui/assignment/assignment_screen.dart';
import 'package:my_family/ui/auth/create_account/add_members_screen.dart';
import 'package:my_family/ui/auth/create_account/create_account_screen.dart';
import 'package:my_family/ui/auth/create_account/family_password_screen.dart';
import 'package:my_family/ui/auth/create_account/family_username_screen.dart';
import 'package:my_family/ui/auth/login_screen.dart';
import 'package:my_family/ui/boarding_screen.dart';
import 'package:my_family/ui/chat/family_members_screen.dart';
import 'package:my_family/ui/do_list/do%20list_screen.dart';
import 'package:my_family/ui/entertainment/add_entertainment_screen.dart';
import 'package:my_family/ui/entertainment/entertainments_screen.dart';
import 'package:my_family/ui/home/home_screen.dart';
import 'package:my_family/ui/profile/profile_screen.dart';
import 'package:my_family/ui/settings/help_screen.dart';
import 'package:my_family/ui/settings/settings_screen.dart';
import 'package:my_family/ui/splash_screen.dart';
import 'package:my_family/ui/study/study_screen.dart';

class AppRoutes {

  static final routesPages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen(), binding: LoginBinging()),
    GetPage(name: Routes.createAccount, page: () => CreateAccountScreen(), binding: CreateAccountBinging()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.entertainments, page: () => EntertainmentsScreen()),
    GetPage(name: Routes.addEntertainments, page: () => AddEntertainmentScreen()),
    GetPage(name: Routes.study, page: () => StudyScreen()),
    GetPage(name: Routes.toDoList, page: () => ToDoListScreen()),
    GetPage(name: Routes.FamilyPassword, page: () => FamilyPasswordScreen()),
    GetPage(name: Routes.FamilyUserName, page: () => FamilyUserNameScreen()),
    GetPage(name: Routes.AddMembers, page: () => AddMembersScreen()),
    GetPage(name: Routes.FamilyMembers, page: () => FamilyMembersScreen()),
    GetPage(name: Routes.Assignment, page: () => AssignmentScreen()),
    GetPage(name: Routes.profile, page: () => ProfileScreen()),
    GetPage(name: Routes.AssignmentDetails, page: () => AssignmentDetailsScreen()),
    GetPage(name: Routes.AssignmentDetails, page: () => AssignmentDetailsScreen()),
    GetPage(name: Routes.Help, page: () => HelpScreen()),
    GetPage(name: Routes.settings, page: () => SettingsScreen()),
  ];
}

class Routes {
  static const splash = '/splash';
  static const boarding = '/boarding';
  static const login = '/login';
  static const createAccount = '/create_account';
  static const home = '/home';
  static const study = '/study';
  static const toDoList = '/to_do';
  static const notifications = '/notifications';
  static const entertainments = '/entertainments';
  static const addEntertainments = '/add_entertainments';
  static const FamilyPassword = '/FamilyPasswordScreen';
  static const FamilyUserName = '/FamilyUserNameScreen';
  static const AddMembers = '/AddMembersScreen';
  static const FamilyMembers = '/FamilyMembersScreen';
  static const Assignment = '/AssignmentScreen';
  static const AssignmentDetails = '/AssignmentDetailsScreen';
  static const profile = '/ProfilScreen';
  static const Help = '/HelpScreen';
  static const settings = '/settings';

}