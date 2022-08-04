class BreakingBadModel {
  BreakingBadModel({
      this.charId, 
      this.name, 
      this.birthday, 
      this.occupation, 
      this.img, 
      this.status, 
      this.appearance, 
      this.nickname, 
      this.portrayed,});

  BreakingBadModel.fromJson(dynamic json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'] != null ? json['occupation'].cast<String>() : [];
    img = json['img'];
    status = json['status'];
    appearance = json['appearance'] != null ? json['appearance'].cast<int>() : [];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
  }
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  List<int>? appearance;
  String? nickname;
  String? portrayed;
BreakingBadModel copyWith({  int? charId,
  String? name,
  String? birthday,
  List<String>? occupation,
  String? img,
  String? status,
  List<int>? appearance,
  String? nickname,
  String? portrayed,
}) => BreakingBadModel(  charId: charId ?? this.charId,
  name: name ?? this.name,
  birthday: birthday ?? this.birthday,
  occupation: occupation ?? this.occupation,
  img: img ?? this.img,
  status: status ?? this.status,
  appearance: appearance ?? this.appearance,
  nickname: nickname ?? this.nickname,
  portrayed: portrayed ?? this.portrayed,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = charId;
    map['name'] = name;
    map['birthday'] = birthday;
    map['occupation'] = occupation;
    map['img'] = img;
    map['status'] = status;
    map['appearance'] = appearance;
    map['nickname'] = nickname;
    map['portrayed'] = portrayed;
    return map;
  }

}