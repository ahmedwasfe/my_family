const String tableEntertainment = 'entertainments';

class EntertainmentsFields {
  static final List<String> values = [
    id,
    title,
  ];

  static const String id = '_id';
  static const String title = 'title';
}

class SaveEntertainments {
  final int? id;
  final String? title;

  const SaveEntertainments(
      {this.id,
      this.title});

  factory SaveEntertainments.fromJson(Map<String, dynamic> json) => SaveEntertainments(
    id: json[EntertainmentsFields.id] as int?,
    title: json[EntertainmentsFields.title] as String,
  );


  Map<String, dynamic> toJson() => {
        EntertainmentsFields.id: id,
        EntertainmentsFields.title: title,
      };

  SaveEntertainments copy(
          {int? id,
          String? title}) =>
      SaveEntertainments(
        id: id ?? this.id,
        title: title ?? this.title,
      );
}
