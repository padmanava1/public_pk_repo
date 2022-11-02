class CharacterModel {
  CharacterModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,

  });

  CharacterModel.fromJson(dynamic json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation =
        json['occupation'] != null ? json['occupation'].cast<String>() : [];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance =
        json['appearance'] != null ? json['appearance'].cast<num>() : [];
    portrayed = json['portrayed'];
    category = json['category'];

  }

  num? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<num>? appearance;
  String? portrayed;
  String? category;

  CharacterModel copyWith({
    num? charId,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? img,
    String? status,
    String? nickname,
    List<num>? appearance,
    String? portrayed,
    String? category,
  }) =>
      CharacterModel(
        charId: charId ?? this.charId,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        occupation: occupation ?? this.occupation,
        img: img ?? this.img,
        status: status ?? this.status,
        nickname: nickname ?? this.nickname,
        appearance: appearance ?? this.appearance,
        portrayed: portrayed ?? this.portrayed,
        category: category ?? this.category,

      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = charId;
    map['name'] = name;
    map['birthday'] = birthday;
    map['occupation'] = occupation;
    map['img'] = img;
    map['status'] = status;
    map['nickname'] = nickname;
    map['appearance'] = appearance;
    map['portrayed'] = portrayed;
    map['category'] = category;

    return map;
  }
}
