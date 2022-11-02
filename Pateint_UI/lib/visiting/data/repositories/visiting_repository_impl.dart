import 'package:dartz/dartz.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/visiting/data/data_sources/visiting_data_source.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';
import 'package:pateint_ui/visiting/domain/repositories/visiting_repository.dart';

class VisitingRepositoryImpl implements VisitingRepository{
final VisitingDataSource visitingDataSource;

  VisitingRepositoryImpl({required this.visitingDataSource});


  @override
  Future<Either<Failures, List<VisitingModel>>> allVisits() async{
    // TODO: implement allVisits
  return visitingDataSource.allVisits();
  }

  @override
  Future<Either<Failures, VisitingModel>> upcomingVisit() {
    // TODO: implement upcomingVisit
    return visitingDataSource.upcomingVisit();
  }




}