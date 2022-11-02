

import 'package:dartz/dartz.dart';

class SignUpUsecase extends Usecase<void,SignupModel>{
  final SignupRepository signupRepository;

  SignUpUsecase({required this.signupRepository});

  @override
  Future<Either<Failures, void>> call(SignupModel params) {
    // TODO: implement call
    return signupRepository.signUpData(params);
  }




}
