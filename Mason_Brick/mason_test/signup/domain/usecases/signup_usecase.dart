

import 'package:dartz/dartz.dart';
import 'package:signup_ui/core/usecases/usecase.dart';
import 'package:signup_ui/signup/data/models/signup_model.dart';

import '../../../core/failures/failures.dart';
import '../repositories/signup_repository.dart';

class SignUpUsecase extends Usecase<void,SignupModel>{
  final SignupRepository signupRepository;

  SignUpUsecase({required this.signupRepository});

  @override
  Future<Either<Failures, void>> call(SignupModel params) {
    // TODO: implement call
    return signupRepository.signUpData(params);
  }




}
