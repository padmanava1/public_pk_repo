import 'package:breaking_bad_api/breaking_bad/data/models/student_model.dart';
import 'package:breaking_bad_api/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:breaking_bad_api/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class AddStudent extends UseCase<void,StudentModel>{

  late BreakingBadRepository repository;


  AddStudent({required this.repository});

  @override
  Future<Either<Failure, void>?>? call(StudentModel studentModel) async{
    // TODO: implement call

    return await repository.addStudent(studentModel);

    throw UnimplementedError();
  }

}