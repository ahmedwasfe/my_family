import 'package:my_family/model/children/child.dart';

class Children {
  bool? status;
  String? msg;
  Result? result;

  Children({this.status, this.msg, this.result});

  Children.fromJson(Map<String, dynamic> json) {
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
  List<ChildData>? children;
  Pagination? pagination;

  Result({this.children, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      children = <ChildData>[];
      json['children'].forEach((v) {
        children!.add(ChildData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  Pagination(
      {this.iItemsOnPage, this.iPerPages, this.iCurrentPage, this.iTotalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    iItemsOnPage = json['i_items_on_page'];
    iPerPages = json['i_per_pages'];
    iCurrentPage = json['i_current_page'];
    iTotalPages = json['i_total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['i_items_on_page'] = iItemsOnPage;
    data['i_per_pages'] = iPerPages;
    data['i_current_page'] = iCurrentPage;
    data['i_total_pages'] = iTotalPages;
    return data;
  }
}