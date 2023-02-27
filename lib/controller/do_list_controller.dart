import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/model/do_list/do_list.dart';

class ToDoListController extends GetxController {
  late GlobalKey<FormState> formKey;

  List<ToDoList> listToDoList = [
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),
    ToDoList(
      title: 'Name Of Child',
      image: 'def_image.png',
      isSelected: true,
    ),

  ];
}