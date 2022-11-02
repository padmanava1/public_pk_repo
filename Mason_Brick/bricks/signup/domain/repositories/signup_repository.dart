
import 'package:dartz/dartz.dart';

abstract class SignupRepository {

  //sign_up repository methods
  Future<Either<Failures, void>> signUpData(SignupModel signupModel);

}
