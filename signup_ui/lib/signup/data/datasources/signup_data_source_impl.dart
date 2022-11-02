import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'signup_data_source.dart';
import '../../../core/failures/failures.dart';
import '../model/signup_model.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  late Dio dio;

  SignUpDataSourceImpl({required this.dio});

  @override
  Future<Either<Failures, void>> signUp(SignUpModel signUpModel) async {
    // TODO: implement signUp
    try{


      print("${signUpModel.countryCode}+${signUpModel.firstName}+ ${signUpModel.gender}");
      return Right(null);
    }
    catch(e){
      return Left(ServerFailure());
    }
  }
}
