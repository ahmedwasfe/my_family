import 'package:my_family/model/family/family.dart';

class Helper {
  int? id;
  String? email;
  Null? name;
  String? imageUrl;
  Family? family;

  Helper({this.id, this.email, this.name, this.imageUrl, this.family});

  Helper.fromJson(Map<String, dynamic> json) {
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