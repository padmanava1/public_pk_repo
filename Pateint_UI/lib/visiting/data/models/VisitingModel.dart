
class VisitingModel {
  VisitingModel({
    this.id,
      this.visitDateTime,
      this.patientname,
      this.patientDOB, 
      this.doctorName, 
      this.doctorQualification, 
      this.doctorAddress,});

  VisitingModel.fromJson(dynamic json) {
    id  = json['id'];
    visitDateTime = json['visitDateTime'];
    patientname = json['patientname'];
    patientDOB = json['patientDOB'];
    doctorName = json['doctorName'];
    doctorQualification = json['doctorQualification'];
    doctorAddress = json['doctorAddress'];
  }
  String? id;
  DateTime? visitDateTime;
  String? patientname;
  DateTime? patientDOB;
  String? doctorName;
  String? doctorQualification;
  String? doctorAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['visitDateTime'] = visitDateTime;
    map['patientname'] = patientname;
    map['patientDOB'] = patientDOB;
    map['doctorName'] = doctorName;
    map['doctorQualification'] = doctorQualification;
    map['doctorAddress'] = doctorAddress;
    return map;
  }

}