import 'package:my_family/model/family/family.dart';

class ChildData {
  int? id;
  String? email;
  String? name;
  String? imageUrl;
  Family? family;
  String? studyPercentage;
  String? entertainmentPercentage;
  String? taskPercentage;
  String? eventPercentage;
  bool isSelected = false;

  ChildData(
      {this.id,
        this.email,
        this.name,
        this.imageUrl,
        this.family,
        this.studyPercentage,
        this.entertainmentPercentage,
        this.taskPercentage,
        this.eventPercentage,
        this.isSelected = false});

  ChildData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    imageUrl = json['image_url'];
    family =
    json['family'] != null ? Family.fromJson(json['family']) : null;
    studyPercentage = json['study_percentage'];
    entertainmentPercentage = json['entertainment_percentage'];
    taskPercentage = json['task_percentage'];
    eventPercentage = json['event_percentage'];
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
    data['study_percentage'] = studyPercentage;
    data['entertainment_percentage'] = entertainmentPercentage;
    data['task_percentage'] = taskPercentage;
    data['event_percentage'] = eventPercentage;
    return data;
  }
}