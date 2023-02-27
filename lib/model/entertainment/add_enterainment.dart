import 'package:my_family/model/entertainment/suggestions/suggestions.dart';

class AddEnterainment {
  bool? status;
  String? msg;
  Result? result;

  AddEnterainment({this.status, this.msg, this.result});

  AddEnterainment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  Entertainment? entertainment;

  Result({this.entertainment});

  Result.fromJson(Map<String, dynamic> json) {
    entertainment = json['entertainment'] != null
        ? Entertainment.fromJson(json['entertainment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (entertainment != null) {
      data['entertainment'] = entertainment!.toJson();
    }
    return data;
  }
}

class Entertainment {
  int? id;
  String? name;
  String? suggestionNo;
  String? imageUrl;
  List<Suggestion>? suggestion;

  Entertainment(
      {this.id, this.name, this.suggestionNo, this.imageUrl, this.suggestion});

  Entertainment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    suggestionNo = json['suggestion_no'];
    imageUrl = json['image_url'];
    if (json['suggestion'] != null) {
      suggestion = <Suggestion>[];
      json['suggestion'].forEach((v) {
        suggestion!.add(Suggestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['suggestion_no'] = suggestionNo;
    data['image_url'] = imageUrl;
    if (suggestion != null) {
      data['suggestion'] = suggestion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestion {
  int? id;
  String? title;
  String? suggestionRate;
  List<ChildrenSuggestionChoice>? childrenSuggestionChoice;

  Suggestion(
      {this.id,
        this.title,
        this.suggestionRate,
        this.childrenSuggestionChoice});

  Suggestion.fromJson(Map<String, dynamic> json) {
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
          this.childrenSuggestionChoice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}