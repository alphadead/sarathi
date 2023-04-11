class User {
  Address? address;
  String? sId;
  String? name;
  String? dob;
  String? email;
  String? education;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.address,
      this.sId,
      this.name,
      this.dob,
      this.email,
      this.education,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    dob = json['dob'];
    email = json['email'];
    education = json['education'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['dob'] = dob;
    data['email'] = email;
    data['education'] = education;
    data['phone'] = phone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Address {
  String? line1;
  String? state;
  String? country;

  Address({this.line1, this.state, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line1'] = line1;
    data['state'] = state;
    data['country'] = country;
    return data;
  }
}
