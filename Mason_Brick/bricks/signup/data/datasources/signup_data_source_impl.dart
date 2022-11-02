import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  late Dio dio;

  SignUpDataSourceImpl({required this.dio});

  @override
  Future<Either<Failures, void>> signUp(SignupModel signupModel) async {
    // TODO: implement signUp
    try{

        // final List<SignupModel> resList = [];
        //
         print(signupModel);
         return Right(null);
    }
        catch(e){
        return Left(ServerFailure());
    }
  }
}
