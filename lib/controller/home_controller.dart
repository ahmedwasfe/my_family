import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/home/pages/calendar_page.dart';
import 'package:my_family/ui/home/pages/family_page.dart';
import 'package:my_family/ui/home/pages/home_page.dart';
import 'package:my_family/ui/home/pages/chat_page.dart';

class HomeController extends GetxController{

  List<Widget> listScreens = [
    HomePage(),
    CalendarPage(),
    ChatPage(),
    FamilyPage(),
  ];

  var navIndex = 0;

  void getCurrenNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }

}