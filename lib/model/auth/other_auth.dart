import 'package:my_family/model/family/family.dart';

class OtherAuth {
  bool? status;
  String? msg;
  Result? result;

  OtherAuth({this.status, this.msg, this.result});

  OtherAuth.fromJson(Map<String, dynamic> json) {
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
  OtherUser? user;
  String? guard;
  String? token;

  Result({this.user, this.guard, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? OtherUser.fromJson(json['user']) : null;
    guard = json['guard'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['guard'] = guard;
    data['token'] = token;
    return data;
  }
}

class OtherUser {
  int? id;
  String? email;
  String? name;
  String? imageUrl;
  Family? family;

  OtherUser({this.id, this.email, this.name, this.imageUrl, this.family});

  OtherUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    imageUrl = json['image_url'];
    family =
    json['family'] != null ? Family.fromJson(json['family']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['image_url'] = imageUrl;
    if (family != null) {
      data['family'] = family!.toJson();
    }
    return data;
  }
}