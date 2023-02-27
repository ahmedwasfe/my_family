class HelperPermissions {
  bool? status;
  String? msg;
  Result? result;

  HelperPermissions({this.status, this.msg, this.result});

  HelperPermissions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (this.result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<PermissionData>? permissions;

  Result({this.permissions});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['helper_permission'] != null) {
      permissions = <PermissionData>[];
      json['helper_permission'].forEach((v) {
        permissions!.add(PermissionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (permissions != null) {
      data['helper_permission'] =
          permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PermissionData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  PermissionData({this.id, this.name, this.createdAt, this.updatedAt});

  PermissionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}