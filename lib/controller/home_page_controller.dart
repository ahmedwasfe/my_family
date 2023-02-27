import 'package:get/get.dart';
import 'package:my_family/controller/home_controller.dart';
import 'package:my_family/model/home_type.dart';

class HomePageController extends GetxController{

  List<HomeType> listHomeType = [
    HomeType(
        title: 'entertainment'.tr,
        image: 'entertainment.png',
        isSelected: true),
    HomeType(
        title: 'study'.tr,
        image: 'study.png',
        isSelected: false),
    HomeType(
        title: 'to_do_list'.tr,
        image: 'to_do_list.png',
        isSelected: false)
  ];

}