class Splash {
  bool? status;
  String? msg;
  Result? result;

  Splash({this.status, this.msg, this.result});

  Splash.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<SplashData>? splash;

  Result({this.splash});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['splash'] != null) {
      splash = <SplashData>[];
      json['splash'].forEach((v) {
        splash!.add(SplashData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.splash != null) {
      data['splash'] = this.splash!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SplashData {
  int? id;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  SplashData(
      {this.id,
        this.image,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  SplashData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}