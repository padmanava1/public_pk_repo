class StudentModel {
  StudentModel({
      this.name,
      this.address,});

  StudentModel.fromJson(dynamic json) {
    name = json['Name'];
    address = json['Address'];
  }
  String? name;
  String? address;
StudentModel copyWith({  int? id,
  String? name,
  String? address,
}) => StudentModel(
  name: name ?? this.name,
  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Address'] = address;
    return map;
  }

}