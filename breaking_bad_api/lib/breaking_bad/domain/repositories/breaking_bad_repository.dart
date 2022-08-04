import 'package:breaking_bad_api/breaking_bad/data/models/breaking_bad_model.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/student_model.dart';
import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BreakingBadRepository{
  Future<Either<Failure,List<BreakingBadModel>>> getAllCharacter();
  Future<Either<Failure,void>> addStudent(StudentModel studentModel);
  Future<Either<Failure, List<StudentModel>>> getAllStudents();
}