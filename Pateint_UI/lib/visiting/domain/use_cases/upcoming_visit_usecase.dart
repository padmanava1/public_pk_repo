import 'package:dartz/dartz.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/core/usecases/usecase.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';
import 'package:pateint_ui/visiting/domain/repositories/visiting_repository.dart';

class UpcomingVisitUsecase extends Usecase{
  final VisitingRepository visitingRepository;

  UpcomingVisitUsecase({required this.visitingRepository});

  @override
  Future<Either<Failures, VisitingModel>> call(params) async{
    // TODO: implement call
    return await visitingRepository.upcomingVisit();
  }



}
