import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';

import '../../data/model/signup_model.dart';
import '../repositories/signup_repository.dart';

class SignUpUsecase extends Usecase<void,SignUpModel>{
  final SignUpRepository signUpRepository;

  SignUpUsecase({required this.signUpRepository});

  @override
  Future<Either<Failures, void>> call(SignUpModel params) {
    // TODO: implement call
    return signUpRepository.signUpData(params);
  }




}
