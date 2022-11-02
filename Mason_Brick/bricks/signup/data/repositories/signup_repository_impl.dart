
import 'package:dartz/dartz.dart';


class SignupRepositoryImpl implements SignupRepository {
  final SignUpDataSource signUpDataSource;

  SignupRepositoryImpl({
    required this.signUpDataSource,
  });

  @override
  Future<Either<Failures, void>> signUpData(SignupModel signupModel) {
 return signUpDataSource.signUp(signupModel);
  }



  //Signup anonymous repository methods impl




}
