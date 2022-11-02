/// groupValue1 : "No"
/// dropdownvalue1 : "item2"
/// dropdownvalue2 : "item3"
/// dropdownvalue3 : "Date"
/// groupValue : "Both Parents"

class QuestionareModel {
  QuestionareModel({
      this.groupValue1, 
      this.dropdownvalue1, 
      this.dropdownvalue2, 
      this.dropdownvalue3, 
      this.groupValue,});

  QuestionareModel.fromJson(dynamic json) {
    groupValue1 = json['groupValue1'];
    dropdownvalue1 = json['dropdownvalue1'];
    dropdownvalue2 = json['dropdownvalue2'];
    dropdownvalue3 = json['dropdownvalue3'];
    groupValue = json['groupValue'];
  }
  String? groupValue1;
  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
  String? groupValue;
QuestionareModel copyWith({  String? groupValue1,
  String? dropdownvalue1,
  String? dropdownvalue2,
  String? dropdownvalue3,
  String? groupValue,
}) => QuestionareModel(  groupValue1: groupValue1 ?? this.groupValue1,
  dropdownvalue1: dropdownvalue1 ?? this.dropdownvalue1,
  dropdownvalue2: dropdownvalue2 ?? this.dropdownvalue2,
  dropdownvalue3: dropdownvalue3 ?? this.dropdownvalue3,
  groupValue: groupValue ?? this.groupValue,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['groupValue1'] = groupValue1;
    map['dropdownvalue1'] = dropdownvalue1;
    map['dropdownvalue2'] = dropdownvalue2;
    map['dropdownvalue3'] = dropdownvalue3;
    map['groupValue'] = groupValue;
    return map;
  }

}