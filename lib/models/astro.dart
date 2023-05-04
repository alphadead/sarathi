class AstroDetails {
  String? sId;
  String? name;
  String? dob;
  String? pob;
  String? tob;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AstroDetails(
      {this.sId,
      this.name,
      this.dob,
      this.pob,
      this.tob,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AstroDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    dob = json['dob'];
    pob = json['pob'];
    tob = json['tob'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['pob'] = this.pob;
    data['tob'] = this.tob;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
