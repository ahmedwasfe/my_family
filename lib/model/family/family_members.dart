import 'package:my_family/model/children/child.dart';
import 'package:my_family/model/helper/helper.dart';

class FamilyMembers {
  bool? status;
  String? msg;
  Result? result;

  FamilyMembers({this.status, this.msg, this.result});

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  FamilyData? family;

  Result({this.family});

  Result.fromJson(Map<String, dynamic> json) {
    family =
    json['family'] != null ? FamilyData.fromJson(json['family']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (family != null) {
      data['family'] = family!.toJson();
    }
    return data;
  }
}

class FamilyData {
  int? id;
  String? parentName;
  String? parentEmail;
  String? otherParentEmail;
  String? otherParentName;
  String? imageUrl;
  List<ChildData>? children;
  List<Helper>? helper;

  FamilyData(
      {this.id,
        this.parentName,
        this.parentEmail,
        this.otherParentEmail,
        this.otherParentName,
        this.imageUrl,
        this.children,
        this.helper});

  FamilyData.fromJson(Map<String, dynamic> json) {
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
      helper = <Helper>[];
      json['helper'].forEach((v) {
        helper!.add(Helper.fromJson(v));
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
    if (helper != null) {
      data['helper'] = helper!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}