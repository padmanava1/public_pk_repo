import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_data_source.dart';
import '../model/signup_model.dart';


class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource signUpDataSource;

  SignUpRepositoryImpl({
    required this.signUpDataSource,
  });

  @override
  Future<Either<Failures, void>> signUpData(SignUpModel signUpModel) {
    return signUpDataSource.signUp(signUpModel);
  }






}
