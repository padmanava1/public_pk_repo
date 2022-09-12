import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../models/signup_model.dart';

abstract class SignUpDataSource {

//sign_up data_source methods
  Future<Either<Failures, void>> signUp(SignUpModel signUpModel);

}
