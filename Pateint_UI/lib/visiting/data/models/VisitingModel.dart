class VisitingModel {
  VisitingModel({
      this.visitDateTime, 
      this.patientname, 
      this.patientDOB, 
      this.doctorName, 
      this.doctorQualification, 
      this.doctorAddress,});

  VisitingModel.fromJson(dynamic json) {
    visitDateTime = json['VisitDateTime'];
    patientname = json['Patientname'];
    patientDOB = json['PatientDOB'];
    doctorName = json['DoctorName'];
    doctorQualification = json['DoctorQualification'];
    doctorAddress = json['DoctorAddress'];
  }
  String visitDateTime;
  String patientname;
  String patientDOB;
  String doctorName;
  String doctorQualification;
  String doctorAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VisitDateTime'] = visitDateTime;
    map['Patientname'] = patientname;
    map['PatientDOB'] = patientDOB;
    map['DoctorName'] = doctorName;
    map['DoctorQualification'] = doctorQualification;
    map['DoctorAddress'] = doctorAddress;
    return map;
  }

}