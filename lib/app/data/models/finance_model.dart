class Finance {
  String? sId;
  String? name;
  String? date;
  int? nominal;
  String? description;
  String? source;
  String? category;
  String? type;
  String? createdAt;
  CreatedBy? createdBy;

  Finance(
      {this.sId,
      this.name,
      this.date,
      this.nominal,
      this.description,
      this.source,
      this.category,
      this.type,
      this.createdAt,
      this.createdBy});

  Finance.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    date = json['date'];
    nominal = json['nominal'];
    description = json['description'];
    source = json['source'];
    category = json['category'];
    type = json['type'];
    createdAt = json['created_at'];
    createdBy = json['created_by'] != null
        ? CreatedBy?.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['date'] = date;
    data['nominal'] = nominal;
    data['description'] = description;
    data['source'] = source;
    data['category'] = category;
    data['type'] = type;
    data['created_at'] = createdAt;
    if (createdBy != null) {
      data['created_by'] = createdBy?.toJson();
    }
    return data;
  }
}

class CreatedBy {
  String? sId;
  String? name;
  String? email;
  String? createdAt;

  CreatedBy({this.sId, this.name, this.email, this.createdAt});

  CreatedBy.fromJson(Map<String, dynamic> json) {
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
