class Family {
  int? id;
  String? parentName;
  String? parentEmail;
  String? otherParentEmail;
  String? otherParentName;
  String? password;
  String? familyName;
  String? familyPassword;
  int? helpersNo;
  int? childrenNo;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Family(
      {this.id,
        this.parentName,
        this.parentEmail,
        this.otherParentEmail,
        this.otherParentName,
        this.password,
        this.familyName,
        this.familyPassword,
        this.helpersNo,
        this.childrenNo,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentName = json['parent_name'];
    parentEmail = json['parent_email'];
    otherParentEmail = json['other_parent_email'];
    otherParentName = json['other_parent_name'];
    password = json['password'];
    familyName = json['family_name'];
    familyPassword = json['family_password'];
    helpersNo = json['helpers_no'];
    childrenNo = json['children_no'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_name'] = parentName;
    data['parent_email'] = parentEmail;
    data['other_parent_email'] = otherParentEmail;
    data['other_parent_name'] = otherParentName;
    data['password'] = password;
    data['family_name'] = familyName;
    data['family_password'] = familyPassword;
    data['helpers_no'] = helpersNo;
    data['children_no'] = childrenNo;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}