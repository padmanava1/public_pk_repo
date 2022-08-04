import 'package:breaking_bad_api/breaking_bad/data/data_sources/remote/breaking_bad_remote_database.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/breaking_bad_model.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/student_model.dart';
import 'package:breaking_bad_api/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class BreakingBadRepositoryImpl implements BreakingBadRepository{
  late BreakingBadRemoteDatabase breakingBadRemoteDatabase;

  BreakingBadRepositoryImpl({required this.breakingBadRemoteDatabase});

  @override
  Future<Either<Failure, List<BreakingBadModel>>> getAllCharacter() async{
    // TODO: implement getAllCharacter
    try{
      final res = await breakingBadRemoteDatabase.getAllCharacter();
      return right(res);
    }
        catch(e){
      return left(LocalFailure());
        }
  }

  @override
  Future<Either<Failure, void>> addStudent(StudentModel studentModel)async {
    // TODO: implement addStudent

    try {
      var res = await breakingBadRemoteDatabase.addStudent(studentModel);
      return Right(null);

    }
    catch (e){
       return Left(LocalFailure());
    }


  }

  @override
  Future<Either<Failure,List<StudentModel>>> getAllStudents() async {
    try{
      final res = await breakingBadRemoteDatabase.getAllStudents();
      return right(res);
    }
        catch(e){
      return left(LocalFailure());
        }
  }
  
}

