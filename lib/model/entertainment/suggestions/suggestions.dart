import 'package:my_family/model/family/family.dart';

class Suggestions {
  int? id;
  String? title;
  String? suggestionRate;
  List<ChildrenSuggestionChoice>? childrenSuggestionChoice;

  Suggestions(
      {this.id,
        this.title,
        this.suggestionRate,
        this.childrenSuggestionChoice});

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    suggestionRate = json['suggestion_rate'];
    if (json['children_suggestion_choice'] != null) {
      childrenSuggestionChoice = <ChildrenSuggestionChoice>[];
      json['children_suggestion_choice'].forEach((v) {
        childrenSuggestionChoice!.add(ChildrenSuggestionChoice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['suggestion_rate'] = suggestionRate;
    if (childrenSuggestionChoice != null) {
      data['children_suggestion_choice'] =
          childrenSuggestionChoice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildrenSuggestionChoice {
  Child? child;
  int? suggestionChoice;

  ChildrenSuggestionChoice({this.child, this.suggestionChoice});

  ChildrenSuggestionChoice.fromJson(Map<String, dynamic> json) {
    child = json['child'] != null ? new Child.fromJson(json['child']) : null;
    suggestionChoice = json['suggestion_choice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.child != null) {
      data['child'] = this.child!.toJson();
    }
    data['suggestion_choice'] = this.suggestionChoice;
    return data;
  }
}

class Child {
  int? id;
  String? email;
  String? name;
  String? imageUrl;
  Family? family;
  String? studyPercentage;
  String? entertainmentPercentage;
  String? taskPercentage;
  String? eventPercentage;

  Child(
      {this.id,
        this.email,
        this.name,
        this.imageUrl,
        this.family,
        this.studyPercentage,
        this.entertainmentPercentage,
        this.taskPercentage,
        this.eventPercentage});

  Child.fromJson(Map<String, dynamic> json) {
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