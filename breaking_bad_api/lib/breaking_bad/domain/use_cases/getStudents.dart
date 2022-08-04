import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:breaking_bad_api/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:breaking_bad_api/breaking_bad/domain/repositories/breaking_bad_repository.dart';

class getAllStudents extends UseCase{
  late final BreakingBadRepository breakingBadRepository;


  getAllStudents(this.breakingBadRepository);

  @override
  Future<Either<Failure, dynamic>?>? call(params) async{
    // TODO: implement call
    return await breakingBadRepository.getAllStudents();
  }


}