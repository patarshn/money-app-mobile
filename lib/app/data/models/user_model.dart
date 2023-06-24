class User {
  String? sId;
  String? name;
  String? email;
  String? createdAt;

  User({this.sId, this.name, this.email, this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    return data;
  }
}
