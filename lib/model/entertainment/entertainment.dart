import 'package:my_family/model/entertainment/suggestions/suggestions.dart';

class Entertainments {
  bool? status;
  String? msg;
  Result? result;

  Entertainments({this.status, this.msg, this.result});

  Entertainments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  List<EntertainmentsData>? entertainments;
  Pagination? pagination;

  Result({this.entertainments, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['entertainments'] != null) {
      entertainments = <EntertainmentsData>[];
      json['entertainments'].forEach((v) {
        entertainments!.add(EntertainmentsData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (entertainments != null) {
      data['entertainments'] =
          entertainments!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class EntertainmentsData {
  int? id;
  String? name;
  int? suggestionNo;
  String? imageUrl;
  List<Suggestions>? suggestions;
  bool isSelected = false;

  EntertainmentsData({this.id, this.name, this.suggestionNo, this.imageUrl, this.suggestions, this.isSelected = false});

  EntertainmentsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    suggestionNo = json['suggestion_no'];
    imageUrl = json['image_url'];
    if (json['suggestion'] != null) {
      suggestions = <Suggestions>[];
      json['suggestion'].forEach((v) {
        suggestions!.add(Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['suggestion_no'] = suggestionNo;
    data['image_url'] = imageUrl;
    if (suggestions != null) {
      data['suggestion'] = suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  Pagination({this.iItemsOnPage, this.iPerPages, this.iCurrentPage, this.iTotalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    iItemsOnPage = json['i_items_on_page'];
    iPerPages = json['i_per_pages'];
    iCurrentPage = json['i_current_page'];
    iTotalPages = json['i_total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['i_items_on_page'] = iItemsOnPage;
    data['i_per_pages'] = iPerPages;
    data['i_current_page'] = iCurrentPage;
    data['i_total_pages'] = iTotalPages;
    return data;
  }
}