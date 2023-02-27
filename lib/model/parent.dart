

import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/helper/helper.dart';

class Parent {
  int? id;
  String? parentName;
  String? parentEmail;
  String? otherParentEmail;
  String? otherParentName;
  String? imageUrl;
  List<ChildData>? children;
  List<Helper>? helpers;

  Parent(
      {this.id,
        this.parentName,
        this.parentEmail,
        this.otherParentEmail,
        this.otherParentName,
        this.imageUrl,
        this.children,
        this.helpers});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentName = json['parent_name'];
    parentEmail = json['parent_email'];
    otherParentEmail = json['other_parent_email'];
    otherParentName = json['other_parent_name'];
    imageUrl = json['image_url'];
    if (json['children'] != null) {
      children = <ChildData>[];
      json['children'].forEach((v) {
        children!.add(ChildData.fromJson(v));
      });
    }
    if (json['helper'] != null) {
      helpers = <Helper>[];
      json['helper'].forEach((v) {
        helpers!.add(Helper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_name'] = parentName;
    data['parent_email'] = parentEmail;
    data['other_parent_email'] = otherParentEmail;
    data['other_parent_name'] = otherParentName;
    data['image_url'] = imageUrl;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (helpers != null) {
      data['helper'] = helpers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}