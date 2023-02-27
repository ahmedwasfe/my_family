import 'package:my_family/model/parent.dart';

class ParentAuth {
  bool? status;
  String? msg;
  Result? result;

  ParentAuth({this.status, this.msg, this.result});

  ParentAuth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  Parent? user;
  String? guard;
  String? token;

  Result({this.user, this.guard, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? Parent.fromJson(json['user']) : null;
    guard = json['guard'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['guard'] = guard;
    data['token'] = token;
    return data;
  }
}