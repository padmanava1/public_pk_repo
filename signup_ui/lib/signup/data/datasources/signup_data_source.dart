import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../model/signup_model.dart';


abstract class SignUpDataSource {

//sign_up data_source methods
  Future<Either<Failures, void>> signUp(SignUpModel signUpModel);

}
