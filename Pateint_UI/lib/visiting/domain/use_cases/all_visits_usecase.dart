import 'package:dartz/dartz.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/core/usecases/usecase.dart';
import 'package:pateint_ui/visiting/domain/repositories/visiting_repository.dart';

class AllVisitsUsecase extends Usecase{
  final VisitingRepository visitingRepository;

  AllVisitsUsecase({required this.visitingRepository});

  @override
  Future<Either<Failures, dynamic>> call(params) async{
    // TODO: implement call
   return await visitingRepository.allVisits();
  }



}