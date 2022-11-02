import 'package:dartz/dartz.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/visiting/data/data_sources/visiting_data_source.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';

class VisitingDataSourceImpl extends VisitingDataSource {
  var data = [
    {
      "id":"10186161",
      "visitDateTime": DateTime.now(),
      "patientname": "Jack Johnson",
      "patientDOB": DateTime.utc(2018,10,28),
      "doctorName": "Elissa Thomas",
      "doctorQualification": "MD",
      "doctorAddress":
          "Main Street Pediatrics\n1234 Main Street, Culver City, CA 90210"
    },
    {
      "id":"10186162",
      "visitDateTime": DateTime.now().add(const Duration(days: 1)),
      "patientname": "Iris Johanesberg",
      "patientDOB": DateTime.utc(2020,01,02),
      "doctorName": "Andrea Russel",
      "doctorQualification": "MD",
      "doctorAddress":
          "Main Street Pediatrics\n1234 Main Street, Culver City, CA 90210"
    },
    {
      "id":"10186163",
      "visitDateTime": DateTime.now().add(const Duration(days: 2)),
      "patientname": "Nick Jonas",
      "patientDOB": DateTime.utc(2019,04,27),
      "doctorName": "Tata McGrawHill",
      "doctorQualification": "MD",
      "doctorAddress":
          "Main Street Pediatrics\n1234 Main Street, Culver City, CA 90210"
    },
    {
      "id":"10186164",
      "visitDateTime": DateTime.now().add(const Duration(days: 3)),
      "patientname": "Henry Pattinson",
      "patientDOB": DateTime.utc(2021,06,12),
      "doctorName": "May Meowth",
      "doctorQualification": "MD",
      "doctorAddress":
          "Main Street Pediatrics\n1234 Main Street, Culver City, CA 90210"
    }
  ];

  @override
  Future<Either<Failures, List<VisitingModel>>> allVisits() async {
    try {
      final jsonList = data;
      List<VisitingModel> allVisitList = [];

      for (var item in jsonList) {
        allVisitList.add(VisitingModel.fromJson(item));
      }
      return Right(allVisitList);
    } catch (e) {
      return Left(ServerFailure(failureMsg: "Server Failure" )) ;
    }
  }

  @override
  Future<Either<Failures, VisitingModel>> upcomingVisit() async {
    try {
      final jsonList = data[0];
      VisitingModel ls = VisitingModel.fromJson(jsonList);
      return Right(ls);
    } catch (e) {
      return Left(ServerFailure(failureMsg: "Server failure")) ;
    }
  }
}
