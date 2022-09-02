
abstract class SignUpDataSource {

//sign_up data_source methods
  Future<Either<Failures, bool>> signUp(
      {required String firstName,
        required String lastName,
      required String email,
      required String password});

}
