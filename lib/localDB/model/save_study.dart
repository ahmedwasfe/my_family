const String tableStudy = 'study';

class StudyFields {
  static final List<String> values = [
    id,
    title,
  ];

  static const String id = '_id';
  static const String title = 'title';
}

class SaveStudy {
  final int? id;
  final String? title;

  const SaveStudy(
      {this.id,
      this.title});

  factory SaveStudy.fromJson(Map<String, dynamic> json) => SaveStudy(
    id: json[StudyFields.id] as int?,
    title: json[StudyFields.title] as String,
  );


  Map<String, dynamic> toJson() => {
    StudyFields.id: id,
    StudyFields.title: title,
      };

  SaveStudy copy(
          {int? id,
          String? title}) =>
      SaveStudy(
        id: id ?? this.id,
        title: title ?? this.title,
      );
}
