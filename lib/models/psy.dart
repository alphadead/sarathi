class PsyDetails {
  final String? id;
  final String? name;
  final String? age;
  final List<String>? hobbies;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  PsyDetails({
    this.id,
    this.name,
    this.age,
    this.hobbies,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PsyDetails.fromJson(Map<String, dynamic> json) => PsyDetails(
        id: json["_id"],
        name: json["name"],
        age: json["age"],
        hobbies: json["hobbies"] == null
            ? []
            : List<String>.from(json["hobbies"]!.map((x) => x)),
        userId: json["userId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "age": age,
        "hobbies":
            hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
        "userId": userId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
