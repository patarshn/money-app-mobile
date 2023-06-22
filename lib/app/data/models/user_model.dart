class User {
  String? sId;
  String? name;
  String? email;
  String? createdAt;
  int? iV;

  User({this.sId, this.name, this.email, this.createdAt, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
