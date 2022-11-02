
import 'package:dartz/dartz.dart';

abstract class SignUpDataSource {

//sign_up data_source methods
  Future<Either<Failures, void>> signUp(SignupModel signupModel);

}
