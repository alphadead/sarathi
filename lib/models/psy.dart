class PsyDetails {
  String? sId;
  String? name;
  String? age;
  List<String>? hobbies;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PsyDetails(
      {this.sId,
      this.name,
      this.age,
      this.hobbies,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PsyDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    age = json['age'];
    hobbies = json['hobbies'].cast<String>();
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['age'] = this.age;
    data['hobbies'] = this.hobbies;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
