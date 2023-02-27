

class HelperSelected{
  String? email;
  String? permission;

  HelperSelected({this.email, this.permission});

  HelperSelected.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['permission'] = permission;
    return data;
  }
}