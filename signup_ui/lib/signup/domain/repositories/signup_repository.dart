import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../../data/model/signup_model.dart';


abstract class SignUpRepository {

  //sign_up repository methods
  Future<Either<Failures, void>> signUpData(SignUpModel signUpModel);

}
